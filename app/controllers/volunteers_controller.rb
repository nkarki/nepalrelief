class VolunteersController < ApplicationController
  before_action :set_volunteer, only: [:show, :edit, :update, :destroy]
  
  def new
    @object = Volunteer.new
  end

  def create
    @object = Volunteer.new volunteer_params
    respond_to do |format|
      if @object.save
        format.html { redirect_to @object, notice: 'Volunteer was successfully created.' }
        format.json { render :show, status: :created, location: @object }
      else
        format.html { render :new }
        format.json { render json: @object.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def 

  def edit
  end

  def index
    if params[:query]
      binding.pry
    else
      @objects = Volunteer.filter(params: params)
    end
  end

  def update
    respond_to do |format|
      if @object.update(volunteer_params)
        format.html { redirect_to @object, notice: 'Volunteer was successfully updated.' }
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
      format.html { redirect_to items_url, notice: 'Volunteer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_volunteer
      @object = Volunteer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def volunteer_params
      params.require(:volunteer).permit(:name, :phone, :email, :skillsets, :location, :available)
    end
end

