class CompositorsController < ApplicationController
  before_action :set_compositor, only: [:show, :edit, :update, :destroy]

  # GET /compositors
  # GET /compositors.json
  def index
    @compositors = Compositor.all
  end

  # GET /compositors/1
  # GET /compositors/1.json
  def show
  end

  # GET /compositors/new
  def new
    @compositor = Compositor.new
  end

  # GET /compositors/1/edit
  def edit
  end

  # POST /compositors
  # POST /compositors.json
  def create
    @compositor = Compositor.new(compositor_params)

    respond_to do |format|
      if @compositor.save
        format.html { redirect_to @compositor, notice: 'Compositor was successfully created.' }
        format.json { render :show, status: :created, location: @compositor }
      else
        format.html { render :new }
        format.json { render json: @compositor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /compositors/1
  # PATCH/PUT /compositors/1.json
  def update
    respond_to do |format|
      if @compositor.update(compositor_params)
        format.html { redirect_to @compositor, notice: 'Compositor was successfully updated.' }
        format.json { render :show, status: :ok, location: @compositor }
      else
        format.html { render :edit }
        format.json { render json: @compositor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compositors/1
  # DELETE /compositors/1.json
  def destroy
    @compositor.destroy
    respond_to do |format|
      format.html { redirect_to compositors_url, notice: 'Compositor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compositor
      @compositor = Compositor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def compositor_params
      params.require(:compositor).permit(:name)
    end
end
