module EtAtosExport
  module ResponseFileBuilder
    module BuildResponseRtfFile
      def self.call(response)
        filename = 'et3_atos_export.rtf'
        original = input_file(response: response)
        return if original.nil? || output_file_present?(response: response, filename: filename)
        response.uploaded_files.build filename: filename,
          file: original.file.blob,
          checksum: original.checksum
      end

      def self.input_file(response:)
        response.uploaded_files.detect { |u| u.filename == 'additional_information.rtf' }
      end

      def self.output_file_present?(response:, filename:)
        response.uploaded_files.any? { |u| u.filename == filename }
      end

      private_class_method :input_file
      private_class_method :output_file_present?
    end
  end
end
