class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @objects = Item.filter(params: params)
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @object = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    puts item_params
    @object = Item.new(item_params)

    respond_to do |format|
      if @object.save
        format.html { redirect_to @object, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @object }
      else
        format.html { render :new }
        format.json { render json: @object.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @object.update(item_params)
        format.html { redirect_to @object, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @object }
      else
        format.html { render :edit }
        format.json { render json: @object.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @object.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @object = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :item_type)
    end
end
