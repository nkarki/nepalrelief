class HowTosController < ApplicationController
  before_action :set_how_to, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @how_tos = HowTo.all
    respond_with(@how_tos)
  end

  def show
    respond_with(@how_to)
  end

  def new
    @how_to = HowTo.new
    respond_with(@how_to)
  end

  def edit
  end

  def create
    @how_to = HowTo.new(how_to_params)
    @how_to.save
    respond_with(@how_to)
  end

  def update
    @how_to.update(how_to_params)
    respond_with(@how_to)
  end

  def destroy
    @how_to.destroy
    respond_with(@how_to)
  end

  private
    def set_how_to
      @how_to = HowTo.find(params[:id])
    end

    def how_to_params
      params[:how_to]
    end
end
