class InsertionsController < ApplicationController
    respond_to :html, :xml, :json
  before_action :set_insertion, only: [:show, :edit, :update, :destroy]

  # GET /insertions
  # GET /insertions.json
  def index
   @ad = Ad.find(params[:ad_id])
    @insertions = @ad.insertions
  end

  # GET /insertions/1
  # GET /insertions/1.json
  def show
  m = @insertion.magazine_id
  @mag = Magazine.find(m)
  end

  # GET /insertions/new
  def new
    @ad = Ad.find(params[:ad_id])
    @insertion = @ad.insertions.build
    respond_with(@insertion)
  end

  # GET /insertions/1/edit
  def edit
  end

  # POST /insertions
  # POST /insertions.json
  def create
    ad = Ad.find(params[:ad_id])
    @insertion = ad.insertions.build(insertion_params)

    respond_to do |format|
      if @insertion.save
        format.html { redirect_to([@insertion.ad, @insertion], notice: 'Insertion was successfully created.') }
        format.json { render :show, status: :created, location: @insertion }
      else
        format.html { render :new }
        format.json { render json: @insertion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /insertions/1
  # PATCH/PUT /insertions/1.json
  def update
    respond_to do |format|
      if @insertion.update(insertion_params)
        format.html { redirect_to @insertion, notice: 'Insertion was successfully updated.' }
        format.json { render :show, status: :ok, location: @insertion }
      else
        format.html { render :edit }
        format.json { render json: @insertion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insertions/1
  # DELETE /insertions/1.json
  def destroy
    @insertion.destroy
    respond_to do |format|
      format.html { redirect_to insertions_url, notice: 'Insertion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insertion
      ad = Ad.find(params[:ad_id])
      @insertion = Insertion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def insertion_params
      params.require(:insertion).permit(:price, :magazine_id, :issue_id, :ad_id)
    end
end
