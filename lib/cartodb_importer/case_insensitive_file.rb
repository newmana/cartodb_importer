module CartodbImporter
  module CaseInsensitiveFile
    def i_file_exists(file_path)
      self.file_path(file_path) && !self.file_path(file_path).nil?
    end

    def i_file_path(file_path)
      Dir.glob(file_path, File::FNM_CASEFOLD).first
    end
  end
end