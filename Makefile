TARGET=_site

build:
	jekyll b

test:
	jekyll s

pack:
	cd $(TARGET)
	rename .html .xhtml ./OEBPS/html/*.html
	sed -i "s/\.html/.xhtml/g" OEBPS/toc.ncx
	sed -i "s/\.html/.xhtml/g" OEBPS/content.opf
	sed -i "s/\.html/.xhtml/g" OEBPS/html/sumario.xhtml
	zip -9r fabio.epub OEBPS

# check:
	# java -jar epubcheck.jar fabio.epub

clean:
	rm -rf $(TARGET)

all: build pack check
