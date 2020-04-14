# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6,7,8} )
inherit bash-completion-r1 distutils-r1

DESCRIPTION="OCRmyPDF adds an OCR text layer to scanned PDF files"
HOMEPAGE="https://github.com/jbarlow83/OCRmyPDF"
MY_GITHUB_AUTHOR="jbarlow83"
SRC_URI="https://github.com/${MY_GITHUB_AUTHOR}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="jbig2enc"

DEPEND=""
RDEPEND="
	${DEPEND}
	app-text/ghostscript-gpl
	app-text/tesseract
	app-text/unpaper
	dev-python/pdfminer-six[${PYTHON_USEDEP}]
	dev-python/pikepdf[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/reportlab[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	media-gfx/img2pdf
	media-gfx/pngquant
	media-libs/leptonica
	virtual/python-cffi[${PYTHON_USEDEP}]
	jbig2enc? ( media-libs/jbig2enc )
"
BDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
