#from setuptools import setup, find_packages
#from setuptools.dist import Distribution
from distutils.core import setup, find_packages
import os

# Get the long description from the README.
with open('README.md', encoding='utf-8') as f:
    long_description = f.read()


# Get the Tesseract version from its source code.
tesseract_version=None
with open('tesseract/api/baseapi.h') as f:
    for line in f.readlines():
        if re.search('TESSERACT_VERSION_STR', line) is not None:
            tesseract_version=line.strip().split(' ')[-1].strip('"')
            break
if tesseract_version is None:
    raise Exception('Could not get Tesseract version. Does tesseract/api/baseapi.h exist?')


# Configure the package data files to include.
package_data = {}
if os.name == 'posix':
    package_data['tesseract'] = ['*.so']
else:
    package_data['tesseract'] = ['*.pyd', '*.dll']


# Get the dependcy list.
with open('requirements.txt') as f:
    dependencies = [ req for req in f.readlines() ]


# Trick from https://github.com/skvark/opencv-python/blob/master/setup.py
# This creates a list which is empty but returns a length of 1.
# Should make the wheel a binary distribution and platlib compliant.
class EmptyListWithLength(list):
    def __len__(self):
        return 1


# Setup
setup(
    name='tesseract-python',
    version=tesseract_version,
    url='https://github.com/ic/tesseract-python',
    license='MIT',
    description='Self-contained Python module to Tesseract.',
    long_description=long_description,
    packages=find_packages(),
    package_data=package_data,
    install_requires=dependencies,
    include_package_data=True,
    ext_modules=EmptyListWithLength(),
    classifiers=[
        'Development Status :: 5 - Production/Stable',
        'Environment :: Console',
        'Intended Audience :: Developers',
        'Intended Audience :: Education',
        'Intended Audience :: Information Technology',
        'Intended Audience :: Science/Research',
        'License :: OSI Approved :: MIT License',
        'Operating System :: MacOS',
        'Operating System :: Microsoft :: Windows',
        'Operating System :: POSIX',
        'Operating System :: Unix',
        'Programming Language :: Python',
        'Programming Language :: Python :: 2',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.4',
        'Programming Language :: Python :: 3.5',
        'Programming Language :: Python :: 3.6',
        'Programming Language :: C++',
        'Programming Language :: Python :: Implementation :: CPython',
        'Topic :: Scientific/Engineering',
        'Topic :: Scientific/Engineering :: Image Recognition',
        'Topic :: Software Development',
    ],
    maintainer='Eric Platon'
)

