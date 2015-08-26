module CartodbImporter

  class ImportShapefile
    include CaseInsensitiveFile

    REQUIRED_EXT = ['shp', 'shx', 'dbf', 'prj']

    def initialize(url_gen)
      @url_gen = url_gen
    end

    def import_for_org(path, file_name, name=nil)
      all_files = REQUIRED_EXT.map { |e| self.i_file_path("#{path}/#{file_name}.#{e}") }
      if all_files.size == 4
        # Assume zip
        Open3.capture3('7za', 'a', zip_file(path, file_name), *all_files)
        begin
          ImportFile.new(@url_gen).upload_table_for_org(zip_file(path, file_name), name)
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
