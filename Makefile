#
# Core tasks automated with make.
#

SHELL:=bash

build: venv tesseract

tesseract:
	sh scripts/tesseract/dep.sh
	sh scripts/tesseract/build.sh

tesseract-clean:
	rm -rf tesseract

venv:
	virtualenv venv
	source venv/bin/activate
	pip install -r requirements.txt

venv-clean:
	rm -rf venv

clean: tesseract-clean
	rm -rf build dist tesseract_python.egg-info
