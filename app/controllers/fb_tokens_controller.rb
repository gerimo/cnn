class FbTokensController < ApplicationController
  before_action :set_fb_token, only: [:show, :edit, :update, :destroy]

  # GET /fb_tokens
  # GET /fb_tokens.json
  def index
    @fb_tokens = FbToken.all
  end

  # GET /fb_tokens/1
  # GET /fb_tokens/1.json
  def show
  end

  # GET /fb_tokens/new
  def new
    @fb_token = FbToken.new
  end

  # GET /fb_tokens/1/edit
  def edit
  end

  # POST /fb_tokens
  # POST /fb_tokens.json
  def create
    @fb_token = FbToken.new(fb_token_params)

    respond_to do |format|
      if @fb_token.save
        format.html { redirect_to @fb_token, notice: 'Fb token was successfully created.' }
        format.json { render :show, status: :created, location: @fb_token }
      else
        format.html { render :new }
        format.json { render json: @fb_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fb_tokens/1
  # PATCH/PUT /fb_tokens/1.json
  def update
    respond_to do |format|
      if @fb_token.update(fb_token_params)
        format.html { redirect_to @fb_token, notice: 'Fb token was successfully updated.' }
        format.json { render :show, status: :ok, location: @fb_token }
      else
        format.html { render :edit }
        format.json { render json: @fb_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fb_tokens/1
  # DELETE /fb_tokens/1.json
  def destroy
    @fb_token.destroy
    respond_to do |format|
      format.html { redirect_to fb_tokens_url, notice: 'Fb token was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fb_token
      @fb_token = FbToken.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fb_token_params
      params.require(:fb_token).permit(:token)
    end
end
