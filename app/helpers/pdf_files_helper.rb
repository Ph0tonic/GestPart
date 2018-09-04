module PdfFilesHelper

  def pdf_file_list_voices(piece_id)
    return ActiveRecord::Base.connection.exec_query("SELECT pdf_voices.id as 'pdf_voice_id', pdf_voices.*, voices.* FROM voices, pdf_voices, pdf_files WHERE pdf_voices.voice_id = voices.id AND pdf_voices.pdf_file_id = pdf_files.id AND pdf_files.piece_id = "+piece_id+" ORDER BY 'orderby' ASC")
  end
end
