import os
import pytesseract

os.environ['TESSDATA_PREFIX'] = os.sep.join([
    os.dirname(__file__),
    'tesseract',
    'share',
    'tessdata'
])

pytesseract.pytesseract.tesseract_cmd = os.sep.join([
    os.path.dirname(os.path.abspath(__file__)),
    'tesseract',
    'bin',
    'tesseract'
])
