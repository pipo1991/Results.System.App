class TablesController < ApplicationController
  
  def index
    if current_user.account_type == "Admin" || current_user.account_type == "Refree" then
      @tables = Table.find(:all, :order => "time ASC")
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @tables }
      end
    end
  end
  
  def show
    if current_user.account_type == "Admin" || current_user.account_type == "Refree" then
 
      @table = Table.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @table }
      end
    end
  end
  
  def new
    if current_user.account_type == "Admin" || current_user.account_type == "Refree" then
      @table = Table.new
    end
  end
  
  def create
    if current_user.account_type == "Admin"  then
      @table = Table.new(params[:table])
      respond_to do |format|
        if @table.save
          format.html { redirect_to @table, notice: 'Post was successfully created.' }
          format.json { render json: @table, status: :created, location: @table }
        else
          format.html { render action: "new" }
          format.json { render json: @table.errors, status: :unprocessable_entity }
        end
      end
    end
  end  
  
  def edit
    if current_user.account_type == "Admin" || current_user.account_type == "Refree" then
      @table = Table.find(params[:id])
    end
  end
  
  def update
    if current_user.account_type == "Admin" || current_user.account_type == "Refree" then
      @table = Table.find(params[:id])
  
      respond_to do |format|
        if @table.update_attributes(params[:table])
           if params[:table][:winner] != "-" then
            p=Post.new
            p.title=current_user.username
            player=User.find(@table.player_id).username
            opp=User.find(@table.opponent_id).username
            if params[:table][:winner] == "W" then
              p.body=player.to_s+" defeats "+opp.to_s+" in "+current_user.username
            elsif params[:table][:winner] == "L" then
              p.body=opp.to_s+" defeats "+player.to_s+" in "+current_user.username
            elsif params[:table][:winner] == "D" then
              p.body=player.to_s+" draw with "+opp.to_s+" in "+current_user.username
            end
            p.save
          end
          format.html { redirect_to @table, notice: 'Post was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @table.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  
  
  def destroy
    if current_user.account_type == "Admin" then
      @table = Table.find(params[:id])
      @table.destroy
  
      respond_to do |format|
        format.html { redirect_to posts_url }
        format.json { head :no_content }
      end
    end
  end
end
