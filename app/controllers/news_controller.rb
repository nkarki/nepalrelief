class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  # GET /news
  # GET /news.json
  def index
    @objects = News.filter(params: params)
  end

  # GET /news/1
  # GET /news/1.json
  def show
  end

  # GET /news/new
  def new
    @object = News.new
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news
  # POST /news.json
  def create
    @object = News.new(news_params)

    respond_to do |format|
      if @object.save
        format.html { redirect_to @object, notice: 'News was successfully created.' }
        format.json { render :show, status: :created, location: @object }
      else
        format.html { render :new }
        format.json { render json: @object.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
    respond_to do |format|
      if @object.update(news_params)
        format.html { redirect_to @object, notice: 'News was successfully updated.' }
        format.json { render :show, status: :ok, location: @object }
      else
        format.html { render :edit }
        format.json { render json: @object.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @object.destroy
    respond_to do |format|
      format.html { redirect_to news_index_url, notice: 'News was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @object = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:published_at, :source, :author, :content)
    end
end
