class GamesController < ApplicationController
  # GET /games
  # GET /games.json
  def index
    if current_user.account_type == "Admin" then
    @games = Game.all
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @games }
      end
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
    if current_user.account_type == "Admin" then
      @game = Game.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @game }
      end
    end
  end

  # GET /games/new
  # GET /games/new.json
  def new
    if current_user.account_type == "Admin" then
      @game = Game.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @game }
      end
    end
  end

  # GET /games/1/edit
  def edit
    if current_user.account_type == "Admin" then
      @game = Game.find(params[:id])
    end
  end

  # POST /games
  # POST /games.json
  def create
    if current_user.account_type == "Admin" then
      @game = Game.new(params[:game])
  
      respond_to do |format|
        if @game.save
          format.html { redirect_to @game, notice: 'Game was successfully created.' }
          format.json { render json: @game, status: :created, location: @game }
        else
          format.html { render action: "new" }
          format.json { render json: @game.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.json
  def update
    if current_user.account_type == "Admin" then
      @game = Game.find(params[:id])
  
      respond_to do |format|
        if @game.update_attributes(params[:game])
          format.html { redirect_to @game, notice: 'Game was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @game.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    if current_user.account_type == "Admin" then
      @game = Game.find(params[:id])
      @game.destroy
  
      respond_to do |format|
        format.html { redirect_to games_url }
        format.json { head :no_content }
      end
    end
  end
end
