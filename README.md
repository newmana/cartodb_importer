CartoDB Importer
===

Depends on command line:

* 7Zip (7za)
* Gdal (ogr2ogr)

Sample Usage:

`./bin/console`

```
> HOST = 'localhost'
> USER_NAME = 'xxx'
> API_KEY = 'abc123'
> URL_GEN = CartodbImporter::UrlGenerator.new(true, 'http', HOST, nil, USER_NAME, API_KEY)
> i = CartodbImporter::ImportShapefile(URL_GEN)
> i.import_for_org('/Users/xxx/upload', 'zones')
```
 
 