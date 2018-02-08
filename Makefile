#
# Core tasks automated with make.
#

SHELL:=bash

build: venv tesseract

wheel: build
	source ./venv/bin/activate
	python setup.py bdist_wheel

distribute: wheel
	source ./venv/bin/activate
	pip install --upgrade twine
	echo DISTRIBUTE TODO

tesseract:
	sh scripts/tesseract/dep.sh
	sh scripts/tesseract/build.sh

tesseract-clean:
	rm -rf tesseract_python/tesseract

venv:
	virtualenv venv
	source ./venv/bin/activate
	pip install -r requirements.txt

venv-clean:
	rm -rf venv

clean: tesseract-clean
	rm -rf build dist tesseract_python.egg-info
