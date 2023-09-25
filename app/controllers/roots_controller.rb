class RootsController < ApplicationController
  before_action :authenticate_and_authorize!
  before_action :set_root, only: %i[ show edit update destroy ]

  # GET /roots or /roots.json
  def index
    @roots = Root.all
  end

  # GET /roots/1 or /roots/1.json
  def show
  end

  # GET /roots/new
  def new
    @root = Root.new
  end

  # GET /roots/1/edit
  def edit
  end

  # POST /roots or /roots.json
  def create
    @root = Root.new(root_params)

    respond_to do |format|
      if @root.save
        format.html { redirect_to root_url(@root), notice: "Root was successfully created." }
        format.json { render :show, status: :created, location: @root }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @root.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roots/1 or /roots/1.json
  def update
    respond_to do |format|
      if @root.update(root_params)
        format.html { redirect_to root_url(@root), notice: "Root was successfully updated." }
        format.json { render :show, status: :ok, location: @root }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @root.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roots/1 or /roots/1.json
  def destroy
    @root.destroy

    respond_to do |format|
      format.html { redirect_to roots_url, notice: "Root was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_root
      @root = Root.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def root_params
      params.require(:root).permit(:name)
    end
end
