class PdfMailer < ApplicationMailer
  default from: GestPart::Application.credentials.USER_NAME,
  :content_type => "multipart/mixed"

  def send_pdf_file(to, subject, pdf)
    @to = to
    @subject = subject
    @pdf = pdf
    attachments['piece.pdf'] = {
      mime_type: 'application/pdf',
      content: @pdf
    }
    mail(:to => @to, :subject => @subject)
  end
end
