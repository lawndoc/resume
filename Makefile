.PHONY : all
all : release

.PHONY : clean
clean :
	rm -f resume.pdf *~
	rm -f content.yaml
	rm -f resume/resume.tex
	rm -f **/*.aux
	rm -f **/*.log
	rm -f *.aux
	rm -f *.log
	rm -f *.out

release : resume.pdf
	rm -f **/*.aux
	rm -f **/*.log
	rm -f *.aux
	rm -f *.log
	rm -f *.out
	rm -rf __pycache__
	mkdir -p release
	mv resume.pdf release/CJ_May_Resume.pdf

resume.pdf : resume/resume.tex
	cd resume && \
	pdflatex -output-directory=.. resume

resume/resume.tex : resume/resume.tex.jinja content.yaml
	jinja2 resume/resume.tex.jinja content.yaml > resume/resume.tex

content.yaml : resume/default_content.yaml
	cp resume/default_content.yaml content.yaml
