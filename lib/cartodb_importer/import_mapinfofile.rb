module CartodbImporter

  class ImportMapinfofile
    include CaseInsensitiveFile

    REQUIRED_EXT = ['dat', 'id', 'map', 'tab']

    def initialize(url_gen)
      @url_gen = url_gen
    end

    def import_for_org(path, file_name, name=nil)
      all_files = REQUIRED_EXT.map {|e| self.i_file_path("#{path}/#{file_name}.#{e}")}
      if all_files.size == 4
        # Assume ogr2ogr
        Open3.capture3("ogr2ogr", '-f', 'ESRI Shapefile', "#{path}/#{file_name}.shp", all_files.last)
        begin
          ImportShapefile.new(@url_gen).import_for_org(path, file_name, name)
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