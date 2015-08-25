module CartodbImporter

  class ImportShapefile

    REQUIRED_EXT = ['shp', 'shx', 'dbf', 'prj']

    def initialize(url_gen)
      @url_gen = url_gen
    end

    def import_for_org(path, file_name)
      if REQUIRED_EXT.inject(true) {|c, e| c && File.exists?("#{path}/#{file_name}.#{e}") }
        # Assume zip
        files_to_zip = REQUIRED_EXT.map { |e| "#{path}/#{file_name}.#{e}" }
        Open3.capture3('7za', 'a', zip_file(path, file_name), *files_to_zip)
        begin
          ImportFile.new(@url_gen).upload_table_for_org(zip_file(path, file_name))
        ensure
          cleanup(path, file_name)
        end
      end
    end

    def cleanup(path, file_name)
      FileUtils.rm(zip_file(path, file_name))
    end

    def zip_file(path, file_name)
      "#{path}/#{file_name}.zip"
    end
  end
end
