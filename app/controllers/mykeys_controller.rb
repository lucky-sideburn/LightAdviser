class MykeysController < ApplicationController
  before_action :set_mykey, only: [:show, :edit, :update, :destroy]

  # GET /mykeys
  # GET /mykeys.json
  def index
    @mykeys = Mykey.where(["user_id = '?'",current_user.id])
  end

  # GET /mykeys/1
  # GET /mykeys/1.json
  def show
  end

  # GET /mykeys/new
  def new
    @mykey = Mykey.new
  end

  # GET /mykeys/1/edit
  def edit
  end

  # POST /mykeys
  # POST /mykeys.json
  def create

    myhash = Hash.new
    myhash["content"] = mykey_params["content"]
    myhash["user_id"] = current_user.id
    @mykey = Mykey.new(myhash)  
    respond_to do |format|
      if @mykey.save
        format.html { redirect_to @mykey, notice: 'Mykey was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mykey }
      else
        format.html { render action: 'new' }
        format.json { render json: @mykey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mykeys/1
  # PATCH/PUT /mykeys/1.json
  def update
    respond_to do |format|
      if @mykey.update(mykey_params)
        format.html { redirect_to @mykey, notice: 'Mykey was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mykey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mykeys/1
  # DELETE /mykeys/1.json
  def destroy
    @mykey.destroy
    respond_to do |format|
      format.html { redirect_to mykeys_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mykey
      @mykey = Mykey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mykey_params
      params.require(:mykey).permit(:content, :user_id)
    end
end
