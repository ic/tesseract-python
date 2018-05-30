tesseract-python - Tesseract binary as a Python module
======================================================

Current Scope
-------------

This module works on a range of configurations, but the PyPi package is more limited at this time.

| Platforms    | Python 2.7 | Python 3.6 |
| :-------:    | :--------: | :--------: |
| Linux x86_64 |  PyPi      | Source     |
| MacOS 10.13  |  PyPi      |            |
| Windows      |            |            |

### Legend

* PyPi: Available on PyPi.
* Source: Working with setup from source.
* Empty: No plan at this time.


###Configuration

* Tesseract 3.05.01
* Leptonica 1.74.4
* Pytesseract 0.2.0


Setup
-----

The module setup relies on building Leptonica, then Tesseract, and finally producing a `bdist_wheel`. The procedure is automated with `make`.

    git clone https://github.com/ic/tesseract-python.git
    cd tesseract-python
    make wheel

The procedure takes quite some time to complete. The wheel is availble under `dist`.

### Note on package managers

The build scripts rely on the following defaults:

* Apt on the Debian family, Yum on the Redhat family.
* On MacOS, the script tries first MacPorts, then Homebrew.

Important: All managers have been tested, *except* Homebrew. If a Homebrew-based fails, please compare with the MacPorts version under `scripts/{leptonica,tesseract}/dep_darwin.sh` (a package may simply be missing or misnamed), and please consider a PR.


Roadmap
-------

* Hopefully manage to get the autoamated PyPi release process nailed and working fully.
* Replace the current ugly shelling to the `tesseract` binary by proper calls to `libtess`. Inspiration in [tesserocr](https://github.com/sirfz/tesserocr).


About the license
-----------------

This repository is under the MIT license. The repository currently exposes code under the GPL 3.0 license for [pytesseract](https://github.com/madmaze/pytesseract/blob/master/LICENSE), and wraps code under the Apache 2.0 license for [Tesseract](https://github.com/tesseract-ocr/tesseract/blob/master/LICENSE).
