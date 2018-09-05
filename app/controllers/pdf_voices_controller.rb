class PdfVoicesController < ApplicationController
  before_action :set_piece, only: [:show, :edit, :update, :destroy, :download, :send_email]

  # GET /pieces
  # GET /pieces.json
  def index
    @pieces = Piece.all
  end

  # GET /pieces/1
  # GET /pieces/1.json
  def show
    set_piece()
  end

  # GET /pieces/new
  def new
    @piece = Piece.new
  end

  # GET /pieces/1/edit
  def edit
  end

  # POST /pieces
  # POST /pieces.json
  def create
    @piece = Piece.new(piece_params)

    respond_to do |format|
      if @piece.save
        format.html { redirect_to edit_piece_path(@piece), notice: 'Piece was successfully created.' }
        format.json { render :show, status: :created, location: @piece }
      else
        format.html { render :new }
        format.json { render json: @piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pieces/1
  # PATCH/PUT /pieces/1.json
  def update
    respond_to do |format|
      if @piece.update(piece_params)
        format.html { redirect_to @piece, notice: 'Piece was successfully updated.' }
        format.json { render :show, status: :ok, location: @piece }
      else
        format.html { render :edit }
        format.json { render json: @piece.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_file
    set_piece()

    params[:piece][:pdf_file_data].each do |file|
        @piece.pdf_files.create!(:piece_id => @piece.id, :attachement => file)
        #create a document associated with the item that has just been created
    end
    redirect_to edit_piece_path(@piece)
  end

  def config_file
    set_piece()

    logger.warn "Ready to manage JSON data"
    logger.warn params[:piece]

    logger.warn params[:piece][:voices]
    final_data = JSON.parse(params[:piece][:voices])
    logger.warn final_data

    final_data.each do |pdf_voice|
      if pdf_voice[8] > 0
        # PdfVoice existante
        pdfVoice = PdfVoice.find(pdf_voice[8])
        pdfVoice.start_page = pdf_voice[4]
        pdfVoice.nb_page = pdf_voice[5]
        pdfVoice.save()
      else
        # PdfVoice new
        PdfVoice.create(pdf_file_id: pdf_voice[6], voice_id: pdf_voice[7], start_page: pdf_voice[4], nb_page: pdf_voice[5])
      end

    end
  end

  # DELETE /pieces/1
  # DELETE /pieces/1.json
  def destroy
    @piece.destroy
    respond_to do |format|
      format.html { redirect_to pieces_url, notice: 'Piece was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def download
    pdf = CombinePDF.new
    source = CombinePDF.load(@pdf_voice.pdf_file.attachement.path)

    i = 0
    while i<@pdf_voice.nb_page do
      pdf << source.pages[@pdf_voice.start_page-1+i]
      i+=1
    end

    send_data pdf.to_pdf, filename: "combined.pdf", type: "application/pdf"
  end

  def send_email
    pdf = CombinePDF.new
    source = CombinePDF.load(@pdf_voice.pdf_file.attachement.path)

    i = 0
    while i<@pdf_voice.nb_page do
      pdf << source.pages[@pdf_voice.start_page-1+i]
      i+=1
    end

    PdfMailer.send_pdf_file(params['email'], params['subject'], pdf.to_pdf).deliver!

    redirect_to "/pieces/"+@pdf_voice.pdf_file.piece_id.to_s+"/"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_piece
      @pdf_voice = PdfVoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def piece_params
      params.require(:pdf_voice).permit(:email, :subject ) #:title, :distribution, :no, :divers, :publishing_house_id, :voices, :storage_id, :to, :subject, :pdf_file_data => [])
    end
end
