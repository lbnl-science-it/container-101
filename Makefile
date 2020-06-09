all: container-101_slides.html container-101.html

container-101.html: container-101.md
	pandoc -s -o container-101.html container-101.md

container-101_slides.html: container-101.md
	pandoc -s --webtex -t slidy -o container-101_slides.html container-101.md

clean:
	rm -rf container-101.html container-101_slides.html
