# [mitinarseny/texlive](http://hub.docker.com/r/mitinarseny/texlive)

[![Docker Pulls](http://img.shields.io/docker/pulls/mitinarseny/texlive?style=flat-square)](http://hub.docker.com/r/mitinarseny/texlive)
[![Docker Stars](http://img.shields.io/docker/stars/mitinarseny/texlive?style=flat-square)](http://hub.docker.com/r/mitinarseny/texlive)

This is a Docker image containing a full [`TeX Live`](http://en.wikipedia.org/wiki/TeX_Live) installation with several fonts. The goal is to provide a base image for my other LaTeX-related containers. Regarding the fonts, we have, e.g., the several pre-installed open Chinese fonts.

## 1. Building and Components

The image has the following components:

- [`TeX Live`](http://www.tug.org/texlive/)
- [`ghostscript`](http://ghostscript.com/)
- [`poppler-utils`](http://poppler.freedesktop.org/)

## 2. License

This image is licensed under the GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007, which you can find in file [LICENSE](LICENSE). The license applies to the way the image is built, while the software components inside the image are under the respective licenses chosen by their respective copyright holders.
