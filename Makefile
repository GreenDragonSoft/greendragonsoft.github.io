.PHONY: all
all: css/creative.css

.PHONY: clean
clean:
	rm css/creative.css


css/creative.css: less/creative.less less/variables.less less/mixins.less
	./node_modules/less/bin/lessc $< > $@
