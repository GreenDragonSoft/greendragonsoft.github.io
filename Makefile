index.html: index.template.html build/combined.css.min

	# sed index.html "s/{{ INLINE_CSS }}/$(shell cat build/combined.css.min)/g" > index.html
	sed index.template.html -e '/<!-- INLINE_CSS -->/ {' -e 'r build/combined.css.min' -e 'd' -e '}' > index.html

.PHONY: all
all: clean index.html

.PHONY: clean
clean:
	find build -type f -delete

build/combined.css.min: build/combined.css
	yui-compressor build/combined.css > build/combined.css.min

build/combined.css: css/main.css css/normalize.css
	cat css/main.css css/normalize.css > build/combined.css

