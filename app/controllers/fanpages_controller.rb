class FanpagesController < ApplicationController
  before_action :set_fanpage, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /fanpages
  # GET /fanpages.json
  def index
    @fanpages = Fanpage.order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 20)
  end

  def home
    @categorys = Category.all
  end
  def search
    
  end
  # GET /fanpages/1
  # GET /fanpages/1.json
  def show
  end

  # GET /fanpages/new
  def new
    @fanpage = Fanpage.new
  end

  # GET /fanpages/1/edit
  def edit
  end

  # POST /fanpages
  # POST /fanpages.json
  def create
    @fanpage = Fanpage.new(fanpage_params)

    respond_to do |format|
      if @fanpage.save
        format.html { redirect_to @fanpage, notice: 'Fanpage was successfully created.' }
        format.json { render :show, status: :created, location: @fanpage }
      else
        format.html { render :new }
        format.json { render json: @fanpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fanpages/1
  # PATCH/PUT /fanpages/1.json
  def update
    respond_to do |format|
      if @fanpage.update(fanpage_params)
        format.html { redirect_to @fanpage, notice: 'Fanpage was successfully updated.' }
        format.json { render :show, status: :ok, location: @fanpage }
      else
        format.html { render :edit }
        format.json { render json: @fanpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fanpages/1
  # DELETE /fanpages/1.json
  def destroy
    @fanpage.destroy
    respond_to do |format|
      format.html { redirect_to fanpages_url, notice: 'Fanpage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fanpage
      @fanpage = Fanpage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fanpage_params
      params.require(:fanpage).permit(:name, :facebook_number, :category_id)
    end
     def sort_column
      Fanpage.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
