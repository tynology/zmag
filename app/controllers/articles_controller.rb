class ArticlesController < ApplicationController
    respond_to :html, :xml, :json
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @magazine = Magazine.find(params[:magazine_id])
    @issue = @magazine.issues.find(params[:issue_id])
    @articles = @issue.articles

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @mag = Magazine.find(params[:magazine_id])
    @issue = @mag.issues.find(params[:issue_id])
    @article = @issue.articles.build
    respond_with(@article)
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    magazine = Magazine.find(params[:magazine_id])
     issue = magazine.issues.find(params[:issue_id])
      @article = issue.articles.build(article_params)

    respond_to do |format|
      if @article.save
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
        format.html { redirect_to([@article.issue.magazine, @article.issue, @article], :notice => 'Comment was successfully created.') }
        #the key :location is associated to an array in order to build the correct route to the nested resource comment
        format.xml  { render :xml => @article, :status => :created, :location => [@article.issue.magazine, @article.issue, @article] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :description, :copy, :photo, :print)
    end

    def issue_params
      params.require(:issue).permit(:title, :printdate, :magazine_id)
    end
end
