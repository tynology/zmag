class IssuesController < ApplicationController
  respond_to :html, :xml, :json
  before_action :set_issue, only: [:show, :edit, :update, :destroy]
  before_action :set_magazines

  # GET /issues
  # GET /issues.json
  def index
    @magazine = Magazine.find(params[:magazine_id])
    @issues = @magazine.issues

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @issues }
    end
  end

  # GET /issues/1
  # GET /issues/1.json
  def show


  end

  # GET /issues/new
  def new
    @mag = Magazine.find(params[:magazine_id])
    @issue = @mag.issues.build
    respond_with(@issue)
  end

  # GET /issues/1/edit
  def edit
    #1st you retrieve the post thanks to params[:post_id]
    magazine = Magazine.find(params[:magazine_id])
    #2nd you retrieve the comment thanks to params[:id]
    @issue = magazine.issues.find(params[:id])
  end

  # POST /issues
  # POST /issues.json
  def create

    magazine = Magazine.find(params[:magazine_id])
    @issue = magazine.issues.build(issue_params)

    respond_to do |format|
      if @issue.save
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
        format.html { redirect_to([@issue.magazine, @issue], :notice => 'Comment was successfully created.') }
        #the key :location is associated to an array in order to build the correct route to the nested resource comment
        format.xml  { render :xml => @issue, :status => :created, :location => [@issue.magazine, @issue] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @issue.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to [@issue.magazine, @issue], notice: 'Issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to magazine_issues_url, notice: 'Issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      magazine = Magazine.find(params[:magazine_id])
      @issue = magazine.issues.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:title, :printdate, :magazine_id)
    end

    def set_magazines
    @magazines = Magazine.all
  end
end
