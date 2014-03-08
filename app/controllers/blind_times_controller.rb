class BlindTimesController < ApplicationController
  # GET /blind_times
  # GET /blind_times.json
  def index
    if current_user.account_type == "Admin" then
    @blind_times = BlindTime.all
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @blind_times }
      end
    end
  end

  # GET /blind_times/1
  # GET /blind_times/1.json
  def show
    if current_user.account_type == "Admin" then
      @blind_time = BlindTime.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @blind_time }
      end
    end
  end

  # GET /blind_times/new
  # GET /blind_times/new.json
  def new
    if current_user.account_type == "Admin" then
      @blind_time = BlindTime.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @blind_time }
      end
    end
  end

  # GET /blind_times/1/edit
  def edit
    if current_user.account_type == "Admin" then
      @blind_time = BlindTime.find(params[:id])
    end
  end

  # POST /blind_times
  # POST /blind_times.json
  def create
    if current_user.account_type == "Admin" then
      @blind_time = BlindTime.new(params[:blind_time])
  
      respond_to do |format|
        if @blind_time.save
          format.html { redirect_to @blind_time, notice: 'Blind time was successfully created.' }
          format.json { render json: @blind_time, status: :created, location: @blind_time }
        else
          format.html { render action: "new" }
          format.json { render json: @blind_time.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /blind_times/1
  # PUT /blind_times/1.json
  def update
    if current_user.account_type == "Admin" then
      @blind_time = BlindTime.find(params[:id])
  
      respond_to do |format|
        if @blind_time.update_attributes(params[:blind_time])
          format.html { redirect_to @blind_time, notice: 'Blind time was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @blind_time.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /blind_times/1
  # DELETE /blind_times/1.json
  def destroy
    if current_user.account_type == "Admin" then
      @blind_time = BlindTime.find(params[:id])
      @blind_time.destroy
  
      respond_to do |format|
        format.html { redirect_to blind_times_url }
        format.json { head :no_content }
      end
     end
  end
end
