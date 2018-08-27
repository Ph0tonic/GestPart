class PdfFilesController < ApplicationController
  before_action :set_pdf_file, only: [:show, :edit, :update, :destroy]

  # GET /pdf_files
  # GET /pdf_files.json
  def index
    @pdf_files = PdfFile.all
  end

  # GET /pdf_files/1
  # GET /pdf_files/1.json
  def show
  end

  # GET /pdf_files/new
  def new
    (params[:image_files] || []).each do |img|
      @product.images.build(file: img)
    end
    @pdf_file = PdfFile.new
  end

  # GET /pdf_files/1/edit
  def edit
  end

  # POST /pdf_files
  # POST /pdf_files.json
  def create
    @pdf_file = PdfFile.new(pdf_file_params)

    respond_to do |format|
      if @pdf_file.save
        format.html { redirect_to @pdf_file, notice: 'Pdf file was successfully created.' }
        format.json { render :show, status: :created, location: @pdf_file }
      else
        format.html { render :new }
        format.json { render json: @pdf_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pdf_files/1
  # PATCH/PUT /pdf_files/1.json
  def update
    respond_to do |format|
      if @pdf_file.update(pdf_file_params)
        format.html { redirect_to @pdf_file, notice: 'Pdf file was successfully updated.' }
        format.json { render :show, status: :ok, location: @pdf_file }
      else
        format.html { render :edit }
        format.json { render json: @pdf_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pdf_files/1
  # DELETE /pdf_files/1.json
  def destroy
    @pdf_file.destroy
    respond_to do |format|
      format.html { redirect_to pdf_files_url, notice: 'Pdf file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pdf_file
      @pdf_file = PdfFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pdf_file_params
      params.require(:pdf_file).permit(:attachement, :piece_id)
    end
end
