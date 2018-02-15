import os
import pytesseract

os.environ['TESSDATA_PREFIX'] = os.sep.join([
    os.path.dirname(__file__),
    'tesseract',
    'share',
    'tessdata'
])

ld_library_paths = [
  os.sep.join([os.path.dirname(__file__), 'tesseract', 'lib']),
  os.sep.join([os.path.dirname(__file__), 'leptonica', 'lib']),
]
if 'LD_LIBRARY_PATH' in os.environ.keys():
  ld_library_paths.append(os.environ['LD_LIBRARY_PATH'])
os.environ['LD_LIBRARY_PATH'] = ':'.join(ld_library_paths)

pytesseract.pytesseract.tesseract_cmd = os.sep.join([
    os.path.dirname(os.path.abspath(__file__)),
    'tesseract',
    'bin',
    'tesseract'
])
