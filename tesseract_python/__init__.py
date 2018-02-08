import os
import pytesseract

pytesseract.pytesseract.tesseract_cmd = os.sep.join([
    os.path.dirname(os.path.abspath(__file__)),
    'tesseract',
    'bin',
    'tesseract'
])
