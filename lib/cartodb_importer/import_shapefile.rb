module CartodbImporter

  REQUIRED_EXT = ['shp', 'shx', 'dbf', 'prj']

  class ImportShapefile
    def initialize(url_gen)
      @url_gen = url_gen
    end

    def import_for_org(path, file_name)
      if REQUIRED_EXT.inject(true) {|c, e| c && File.exists?("#{path}/#{file_name}.#{e}") }
        # Assume zip
        zip_file = "#{path}/#{file_name}.zip"
        `zip #{zip_file} #{REQUIRED_EXT.map{|e| "#{path}/#{file_name}.#{e}"}.join(' ')}`
        ImportFile.new(@url_gen).upload_table_for_org(zip_file)
      end
    end
  end
end
