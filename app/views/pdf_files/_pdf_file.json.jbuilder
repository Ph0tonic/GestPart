json.extract! pdf_file, :id, :name, :attachement, :created_at, :updated_at
json.url pdf_file_url(pdf_file, format: :json)
