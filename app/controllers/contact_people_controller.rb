class ContactPeopleController < ApplicationController
  before_action :set_contact_person, only: [:show, :edit, :update, :destroy]

  # GET /contact_people
  # GET /contact_people.json
  def index
    @objects = ContactPerson.filter(params: params)
  end

  # GET /contact_people/1
  # GET /contact_people/1.json
  def show
  end

  # GET /contact_people/new
  def new
    @object = ContactPerson.new
  end

  # GET /contact_people/1/edit
  def edit
  end

  # POST /contact_people
  # POST /contact_people.json
  def create
    @object = ContactPerson.new(contact_person_params)

    respond_to do |format|
      if @object.save
        format.html { redirect_to @object, notice: 'Contact person was successfully created.' }
        format.json { render :show, status: :created, location: @object }
      else
        format.html { render :new }
        format.json { render json: @object.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_people/1
  # PATCH/PUT /contact_people/1.json
  def update
    respond_to do |format|
      if @object.update(contact_person_params)
        format.html { redirect_to @object, notice: 'Contact person was successfully updated.' }
        format.json { render :show, status: :ok, location: @object }
      else
        format.html { render :edit }
        format.json { render json: @object.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_people/1
  # DELETE /contact_people/1.json
  def destroy
    @object.destroy
    respond_to do |format|
      format.html { redirect_to contact_people_url, notice: 'Contact person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_person
      @object = ContactPerson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_person_params
      params.require(:contact_person).permit(:name, :phone, :organization_id, :site_id)
    end
end
