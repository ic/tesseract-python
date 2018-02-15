import os
import pytesseract

os.environ['TESSDATA_PREFIX'] = os.sep.join([
    os.path.dirname(__file__),
    'tesseract',
    'share',
    'tessdata'
])

os.environ['LD_LIBRARY_PATH'] = ':'.join([
  os.sep.join([os.path.dirname(__file__), 'tesseract', 'lib'])
  os.environ['LD_LIBRARY_PATH']
])

pytesseract.pytesseract.tesseract_cmd = os.sep.join([
    os.path.dirname(os.path.abspath(__file__)),
    'tesseract',
    'bin',
    'tesseract'
])
