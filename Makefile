all: container-101-lawrencium_slides.html container-101-lawrencium.html

container-101-lawrencium.html: container-101-lawrencium.md
	pandoc -s -o container-101-lawrencium.html container-101-lawrencium.md

container-101-lawrencium_slides.html: container-101-lawrencium.md
	pandoc -s --webtex -t slidy -o container-101-lawrencium_slides.html container-101-lawrencium.md

clean:
	rm -rf container-101-lawrencium.html container-101-lawrencium_slides.html
