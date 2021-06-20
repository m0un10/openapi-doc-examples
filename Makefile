.PHONY: redoc

# definition: 8880
# redoc: 8881
# slate: 8882

pwd=$$(PWD)

download:
	wget http://localhost:8080/swagger/v1/swagger.json

run-definition:
	docker run -d -v $(pwd)/swagger.json:/usr/local/apache2/htdocs/swagger.json --name swagger-definition -p 8880:80 httpd

# Allows theming and vendor extensions (e.g. x-logo)
# https://github.com/Redocly/redoc
run-redoc:
	docker run -d -p 8881:80 --name redoc -e SPEC_URL=http://localhost:8880/swagger.json redocly/redoc

build-widdershins:
	widdershins --search false --language_tabs 'java:Java' 'csharp:.NET' --summary swagger.json -o output.md
	cp output.md slate/source/index.html.md

build-slate: build-widdershins
	mkdir -p slate-generated 
	docker run --rm -v $$(PWD)/slate-generated:/srv/slate/build -v $$(PWD)/slate/source:/srv/slate/source slatedocs/slate

run-slate:
	docker run -d -v $$(PWD)/slate-generated:/usr/local/apache2/htdocs/ --name slate -p 8882:80 httpd

