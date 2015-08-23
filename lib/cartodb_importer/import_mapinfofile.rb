module CartodbImporter

  class ImportMapinfofile

    REQUIRED_EXT = ['dat', 'id', 'map', 'tab']

    def initialize(url_gen)
      @url_gen = url_gen
    end

    def import_for_org(path, file_name)
      if REQUIRED_EXT.inject(true) { |c, e| c && File.exists?("#{path}/#{file_name}.#{e}") }
        # Assume ogr2ogr
        Open3.capture3("ogr2ogr", '-f', '"ESRI Shapefile"', "#{path}/#{file_name}.shp", "#{path}/#{file_name}.tab")
        begin
          ImportShapefile.new(@url_gen).import_for_org(path, file_name)
        ensure
          cleanup(path, file_name)
        end
      end
    end

    def cleanup(path, file_name)
      ImportShapefile::REQUIRED_EXT.each { |f| FileUtils.rm("#{path}/#{file_name}.#{f}") }
    end
  end
end