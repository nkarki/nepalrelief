class SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy]

  # GET /sites
  # GET /sites.json
  def index
    @objects = Site.filter(params: params)
  end

  # GET /sites/1
  # GET /sites/1.json
  def show
    @contacts = ContactPerson.where(site: @object)
  end

  # GET /sites/new
  def new
    @object = Site.new
  end

  # GET /sites/1/edit
  def edit
  end

  # POST /sites
  # POST /sites.json
  def create
    @object = Site.new(site_params)

    respond_to do |format|
      if @object.save
        format.html { redirect_to @object, notice: 'Site was successfully created.' }
        format.json { render :show, status: :created, location: @object }
      else
        format.html { render :new }
        format.json { render json: @object.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sites/1
  # PATCH/PUT /sites/1.json
  def update
    respond_to do |format|
      if @object.update(site_params)
        format.html { redirect_to @object, notice: 'Site was successfully updated.' }
        format.json { render :show, status: :ok, location: @object }
      else
        format.html { render :edit }
        format.json { render json: @object.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @object.destroy
    respond_to do |format|
      format.html { redirect_to sites_url, notice: 'Site was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @object = Site.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.required(:site).permit(:name, :zone, :district, :address1, :address2, :zip, :latitude, :longitude, :severity, :population)
    end
end
