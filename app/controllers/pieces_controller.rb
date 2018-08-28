class PiecesController < ApplicationController
  before_action :set_piece, only: [:show, :edit, :update, :destroy]

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

    # if @piece.save
    #    #iterate through each of the files
    #    params[:piece][:pdf_file_data].each do |file|
    #        @piece.pdf_files.create!(:attachement => file)
    #        #create a document associated with the item that has just been created
    #    end
    #    render :show, status: :created, location: @piece
    #  else
    #    render json: @piece.errors, status: :unprocessable_entity
    #  end

    respond_to do |format|
      if @piece.save
        format.html { redirect_to edit_piece_path(@piece), notice: 'Piece was successfully created.' }
        # format.html { redirect_to @piece, notice: 'Piece was successfully created.' }
        # format.json { render :show, status: :created, location: @piece }
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

    logger.warn "It works!"
    params[:piece][:pdf_file_data].each do |file|
        @piece.pdf_files.create!(:piece_id => @piece.id, :attachement => file)
        #create a document associated with the item that has just been created
    end
    redirect_to edit_piece_path(@piece)
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
      params.require(:piece).permit(:title, :distribution, :no, :divers, :publishing_house_id, :storage_id, :pdf_file_data => [])
    end
end
