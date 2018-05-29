#
# Core tasks automated with make.
#

SHELL:=bash

build: venv tesseract

wheel: build
	source venv/bin/activate && python setup.py --verbose bdist_wheel

distribute:
	bash scripts/distribute.sh

leptonica:
	sh scripts/leptonica/dep.sh
	sh scripts/leptonica/build.sh

leptonica-clean:
	rm -rf tesseract_python/leptonica

tesseract: leptonica
	sh scripts/tesseract/dep.sh
	sh scripts/tesseract/build.sh

tesseract-clean:
	rm -rf tesseract_python/tesseract

venv:
	virtualenv venv
	source venv/bin/activate && pip install -r requirements.txt

venv-clean:
	rm -rf venv

clean: tesseract-clean leptonica-clean
	rm -rf build dist tesseract_python.egg-info
