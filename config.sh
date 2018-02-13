function pre_build {
  pwd
  ls -l /io
  # Make Tesseract and Leptonica
  make
}

function run_tests {
  python --version
  python -c "import tesseract_python; from PIL import Image; tesseract_python.pytesseract.image_to_string(Image.open('test/data/img_with_text.png'))"
}
