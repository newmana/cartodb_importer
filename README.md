CartoDB Importer
===

Depends on the following binaries being available on command line:

* 7Zip (7za) - http://www.7-zip.org/
* gdal (ogr2ogr) - http://www.gdal.org/

Sample Usage:

`./bin/console`

```
> SUBDOMAINLESS_URLS = true
> HOST = 'localhost'
> USER_NAME = 'xxx'
> API_KEY = 'abc123'
> URL_GEN = CartodbImporter::UrlGenerator.new(SUBDOMAINLESS_URLS, 'http', HOST, nil, USER_NAME, API_KEY)
> i = CartodbImporter::ImportShapefile(URL_GEN)
> i.import_for_org('/Users/xxx/upload', 'zones')
```
 
 