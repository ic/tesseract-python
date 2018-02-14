tesseract-python - Tesseract binary as a Python module
======================================================

WIP: This module is not yet functional.

The first version is targetting Tesseract 3.05.01.

Status
------

* The current version builds and works fine on Darwin, Ubuntu, and CentOS.
* The PyPi release process is not working yet, so a simple `pip install` is not yet at reach, except for Linux x86_64 (manually released).
* The current code exposes the [pytesseract](https://github.com/madmaze/pytesseract) module, configured with the embdedded Tesseract. It means all calls are shelled out to a `tesseract` binary.


Roadmap
-------

* Hopefully manage to get the autoamated PyPi release process nailed and working fully.
* Replace the current ugly shelling to the `tesseract` binary by proper calls to `libtess`. Inspiration in [tesserocr](https://github.com/sirfz/tesserocr).


About the license
-----------------

This repository is under the MIT license. The repository currently exposes code under the GPL 3.0 license for [pytesseract](https://github.com/madmaze/pytesseract/blob/master/LICENSE), and wraps code under the Apache 2.0 license for [Tesseract](https://github.com/tesseract-ocr/tesseract/blob/master/LICENSE).
