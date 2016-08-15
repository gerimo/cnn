class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  # GET /posts
  # GET /posts.json
  def index
    if params[:date_from].present? && params[:date_end].present? && params[:category_id].present?
      @fanpages = Fanpage.where(category_id: params[:category_id])
      datef = Date.parse params[:date_from]
      datee = Date.parse params[:date_end]
      @posts = Post.where("fb_created_time > ?", datef).where("fb_created_time < ?", datee).where("fanpage_id IN (?)", @fanpages.each do |fanpage| fanpage.id end).order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 50)
    elsif params[:date_from].present? && params[:category_id].present?
      @fanpages = Fanpage.where(category_id: params[:category_id])
      datef = Date.parse params[:date_from]
      @posts = Post.where("fb_created_time > ?", datef).where("fanpage_id IN (?)", @fanpages.each do |fanpage| fanpage.id end).order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 50)
    elsif params[:date_end].present? && params[:category_id].present?
      @fanpages = Fanpage.where(category_id: params[:category_id])
      datee = Date.parse params[:date_end]
      @posts = Post.where("fb_created_time < ?", datee).where("fb_created_time < ?", datee).where("fanpage_id IN (?)", @fanpages.each do |fanpage| fanpage.id end).order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 50)
    elsif params[:date_from].present? && params[:date_end].present?
      datef = Date.parse params[:date_from]
      datee = Date.parse params[:date_end]
      @posts = Post.where("fb_created_time > ?", datef).where("fb_created_time < ?", datee).order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 50)
    elsif params[:category_id].present?
      @fanpages = Fanpage.where(category_id: params[:category_id])
      @posts = Post.where("fanpage_id IN (?)", @fanpages.each do |fanpage| fanpage.id end).order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 50)
    else
     @posts = Post.order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 50)
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:facebook_id, :content, :share_count, :like_count, :comment_count,:fanpage_id)
    end

    def sort_column
      Post.column_names.include?(params[:sort]) ? params[:sort] : "content"
    end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
end
