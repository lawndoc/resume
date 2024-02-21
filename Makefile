ifeq ($(shell uname), Darwin)
CC=clang
CXX=clang++
AR=ar
endif

.PHONY : all
all : PDFGitPolyglot.pdf

release : PDFGitPolyglot.pdf
	rm resume*[!.tex]
	rm *.aux
	rm *.log
	rm *.out
	rm -rf __pycache__

.PHONY : local-clean
local-clean :
	rm -f PDFGitPolyglot.pdf resume.pdf resume.log resume.aux *~

.PHONY : clean
clean : git-submodule local-clean
	$(MAKE) -C git clean

.PHONY : git-submodule
git-submodule :
	git submodule init
	git submodule update --recursive

git/configure : | git-submodule
	$(MAKE) -C git configure
	cd git && ./configure

git/git : | git/configure
	$(MAKE) CC=$(CC) CXX=$(CXX) AR=$(AR) -C git

kolskaya.pdf : kolskaya.tex
	pdflatex $<

resume.pdf : resume.tex
	pdflatex resume
	pdflatex resume

%_small.jpg : %.jpg
	convert $< -define jpeg:extent=63kb $@

%_injected.pdf %.pdf.block_offsets : %.pdf fix_oversize_pdf.py
	./fix_oversize_pdf.py $*.pdf $*_injected.pdf

PDFGitPolyglot.pdf : resume_injected.pdf resume.pdf.block_offsets git/git update_deflate_headers.py
	./make_polyglot.sh resume_injected.pdf $@
	mv $@ $@.polyglot
	./update_deflate_headers.py $@.polyglot $@ resume.pdf.block_offsets
	rm $@.polyglot
# Ignore any errors given by verify_xrefs, since it's not 100% accurate
#	./verify_xrefs.py $@ || true
