class PiecesController < ApplicationController
  before_action :set_piece, only: [:show, :edit, :update, :destroy, :add_genre, :remove_genre, :add_author, :remove_author, :add_arranger, :remove_arranger]

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

  def add_genre
    param = params[:piece][:tag_input]
    genre = Genre.find_by(name: param)
    if genre == nil
      genre = Genre.create(name: param)
    end
    @piece.genres << genre
  end

  def remove_genre
    param = params[:piece][:tag_input]
    genre = @piece.genres.find_by(name: param)
    if genre != nil
      @piece.genres.delete(genre)
    else
      # Strange
      raise "error"
    end
  end

  def add_author
    param = params[:piece][:tag_input]
    compositor = Compositor.find_by(name: param)
    if compositor == nil
      compositor = Compositor.create(name: param)
    end
    Composition.create(author: true, compositor_id: compositor.id, piece_id: @piece.id)
  end

  def remove_author
    param = params[:piece][:tag_input]
    compositor = Compositor.find_by(name: param)
    if compositor != nil
      @piece.compositions.where(author: true, compositor_id: compositor.id).delete_all
    else
      # Strange
      raise "error"
    end
  end

  def add_arranger
    param = params[:piece][:tag_input]
    compositor = Compositor.find_by(name: param)
    if compositor == nil
      compositor = Compositor.create(name: param)
    end
    Composition.create(author: false, compositor_id: compositor.id, piece_id: @piece.id)
  end

  def remove_arranger
    param = params[:piece][:tag_input]
    compositor = Compositor.find_by(name: param)
    if compositor != nil
      @piece.compositions.where(author: false, compositor_id: compositor.id).delete_all
    else
      # Strange
      raise "error"
    end
  end

  def config_file
    set_piece()
    final_data = JSON.parse(params[:piece][:voices])

    final_data.each do |pdf_voice|
      if pdf_voice[8] > 0
        # Existing PdfVoice
        pdfVoice = PdfVoice.find(pdf_voice[8])
        pdfVoice.start_page = pdf_voice[4]
        pdfVoice.nb_page = pdf_voice[5]
        pdfVoice.save()
      else
        # TODO FIX ISSUES WHEN SAVING MORE THAN ON TIME
        # New PdfVoice
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_piece
      @piece = Piece.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def piece_params
      params.require(:piece).permit(:title, :distribution, :no, :divers, :publishing_house_id, :voices, :storage_id, :tag_input, :pdf_file_data => [])
    end
end
