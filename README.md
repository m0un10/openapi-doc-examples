# openapi-doc-examples

## Serve static swagger.json

To run this example, you must make sure you have a swagger.json in this directory.

```
make run-definition
open http://localhost:8880/swagger.json
```

## Redoc example

To run this example, you should make sure you have the swagger.json served at `localhost:8880/swagger.json`.

```
make run-redoc
open http://localhost:8881
```

You will also need to disable CORS in your browser as it accesses the swagger.json from the client-side code.

## Slate example

This example requires slate code repository downloaded.

```
make download-slate
```

The logo.png can be customised at `slate/source/images/logo.png`

After you have slate and any desired customisations, run the following:

```
make build-slate run-slate
open http://localhost:8882
```

## Uninstall

```
docker rm -f swagger-definition
docker rm -f redoc
docker rm -f slate
```