module ClaimFileBuilder
  module BuildResponseTextFile
    include RenderToFile
    def self.call(response)
      filename = 'et3_atos_export.txt'
      response.uploaded_files.build filename: filename,
                                    file: raw_text_file(filename, response: response)
    end

    def self.raw_text_file(filename, response:)
      ActionDispatch::Http::UploadedFile.new filename: filename,
                                             tempfile: render_to_file(object: response),
                                             type: 'text/plain'
    end

    def self.render(response)
      ApplicationController.render "file_builders/export_response.txt.erb", locals: {
        response: response,
        respondent: response.respondent,
        representative: response.representative
      }
    end

    private_class_method :raw_text_file, :render
  end
end
