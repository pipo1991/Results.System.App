class FinalMatchesController < ApplicationController
  # GET /final_matches
  # GET /final_matches.json
  def index
    @final_matches = FinalMatch.find(:all, :order => "time ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @final_matches }
    end
  end

  # GET /final_matches/1
  # GET /final_matches/1.json
  def show
    @final_match = FinalMatch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @final_match }
    end
  end

  # GET /final_matches/new
  # GET /final_matches/new.json
  def new
    @final_match = FinalMatch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @final_match }
    end
  end

  # GET /final_matches/1/edit
  def edit
    @final_match = FinalMatch.find(params[:id])
  end

  # POST /final_matches
  # POST /final_matches.json
  def create
    @final_match = FinalMatch.new(params[:final_match])

    respond_to do |format|
      if @final_match.save
        format.html { redirect_to @final_match, notice: 'Final match was successfully created.' }
        format.json { render json: @final_match, status: :created, location: @final_match }
      else
        format.html { render action: "new" }
        format.json { render json: @final_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /final_matches/1
  # PUT /final_matches/1.json
  def update
    @final_match = FinalMatch.find(params[:id])

    respond_to do |format|
      if @final_match.update_attributes(params[:final_match])
        if @final_match.winner != "Not played" then
          p=Post.new
          p.title="Finals"
          other=@final_match.player
          if other==@final_match.winner then
            other=@final_match.opponent
          end
          p.body=@final_match.winner+" has defeated "+other
          p.save
        end
        format.html { redirect_to @final_match, notice: 'Final match was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @final_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /final_matches/1
  # DELETE /final_matches/1.json
  def destroy
    @final_match = FinalMatch.find(params[:id])
    @final_match.destroy

    respond_to do |format|
      format.html { redirect_to final_matches_url }
      format.json { head :no_content }
    end
  end
end
