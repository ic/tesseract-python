from setuptools import setup, find_packages
#from setuptools.dist import Distribution
import os
import re

# Get the long description from the README.
with open('README.md') as f:
    long_description = f.read()


# Get the Tesseract version from its source code.
tesseract_version=None
with open('tesseract-src/api/baseapi.h') as f:
    for line in f.readlines():
        if re.search('TESSERACT_VERSION_STR', line) is not None:
            tesseract_version=line.strip().split(' ')[-1].strip('"')
            break
if tesseract_version is None:
    raise Exception('Could not get Tesseract version. Does tesseract/api/baseapi.h exist?')


# Configure the package data files to include.
package_data_files = []
for dir_path, _, file_names in os.walk('lib/tesseract'):
    path_elements = dir_path.split(os.sep)[1:]
    for f in file_names:
        path_elements.append(f)
        fpath = os.sep.join(path_elements)
        package_data_files.append(fpath)
package_data = { 'lib': package_data_files }


# Get the dependency list.
with open('requirements.txt') as f:
    dependencies = [ req for req in f.readlines() ]


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
    #eager_resources=package_data_files,
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

