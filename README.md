CartoDB Importer
===

Depends on command line:

* 7Zip (7za)
* Gdal (ogr2ogr)

Sample Usage:

`./bin/console`

```
> URL_GEN = CartodbImporter::UrlGenerator.new(true, 'http', 'localhost', nil, 'xxx', 'abc123')
> i = CartodbImporter::ImportShapefile(URL_GEN)
> i.import_for_org('/Users/xxx/upload', 'zones')
```
 
 