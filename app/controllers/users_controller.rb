class UsersController < ApplicationController
  before_filter :is_login?

  def index
    @objects = User.filter(params: params)
    authorize! :index, @objects, :message => 'Not authorized as an administrator.'
  end

  def new
    @object = User.new
    authorize! :new, @object, :message => 'Not authorized as an administrator.'
  end

  def create
    password = Devise.friendly_token.first(8)
    params[:user][:password] = password
    @object = User.new(user_params)
    authorize! :create, @object, :message => 'Not authorized as an administrator.'

    respond_to do |format|
      if @object.save
        UserMailer.account_created_mail(@object, password)
        format.html { redirect_to users_url, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @object }
      else
        format.html { render :new }
        format.json { render json: @object.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @object = User.find(params[:id])
    if params[:own]
      @for_devise_view = params[:own]
      if !params[:error].blank?
        @error = params[:error]
      end
    end
    authorize! :edit, @object, :message => 'Not authorized as an administrator.'
  end

  def update
    @object = User.find(params[:id])
    puts "here i am for update"
    respond_to do |format|
      if @object.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @object }
      else
        format.html { render :edit }
        format.json { render json: @object.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @object = User.find(params[:id])
    authorize! :destroy, @object, :message => 'Not authorized as an administrator.'

    respond_to do |format|
      if @object.destroy
        format.html { redirect_to :back, notice: 'User deleted sucessfully from database!' }
        format.json { head :no_content }
      else
        format.html { redirect_to :back, alert: 'Error deleting user !' }
        format.json { render json: @object.errors, status: :unprocessable_entity }
      end
    end
  end

  def inactive
  	@objects = User.filter(params: params).where("approved = false")
  end

  def activate
  	@object = User.find(params[:id])
    authorize! :activate, @object, :message => 'Not authorized as an administrator.'

  	if @object.approved == false or @object.approved.nil?
  		if @object.update({ :approved => true })
        UserMailer.account_activate_mail(@object)
  			redirect_to :back, notice: 'User activated sucessfully !'
  		else
  			redirect_to inactive_users_url, alert: 'Error activating user !'
  		end
    else
      if @object.update({ :approved => false })
        redirect_to :back, notice: 'User De-activated sucessfully !'
      else
        redirect_to inactive_users_url, alert: 'Error De-activating user !'
      end
    end
  end

  private

    def user_params
      params.require(:user).permit(:role, :approved, :email, :firstname, :lastname, :password, :phone)
    end
end
