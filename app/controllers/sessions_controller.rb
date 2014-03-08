  class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      flash[:notice] = "Logged in!"
      showTable
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
  
  def showTable
    if session[:user_id]
      render :myTable
    else      
      render "new"
    end
  end
  
  def showFinals
    if session[:user_id]
      render :finals
    else      
      render "new"
    end
  end
  
  def showAllTable
    if session[:user_id]
      render :allTable
    else      
      render "new"
    end
  end
  
  def showNews
    if session[:user_id]
      render :news
    else      
      render "new"
    end
  end
  
  def showRanking
    if session[:user_id]
      @teams=[]
      for i in 1..30
        if i==2 || i== 13 || i==23 || i==24 then
          @teams.push({:name => User.find(i).username,:win => 0 ,:draw => 0,:lose => 0, :score => 2})
        else
          @teams.push({:name => User.find(i).username,:win => 0 ,:draw => 0,:lose => 0, :score => 0})
        end
      end
      for i in 1..30
        matches=Table.where("player_id = ? ",i)
        timeL=BlindTime.first.time
        for j in matches
          if j.time < timeL || current_user.account_type == "Admin" then
            if j.winner=="W" then
              @teams.at(i-1)[:score]=@teams.at(i-1)[:score]+3
              @teams.at(i-1)[:win]= @teams.at(i-1)[:win]+1
            elsif j.winner=="D" then
              @teams.at(i-1)[:score]=@teams.at(i-1)[:score]+1
              @teams.at(i-1)[:draw]= @teams.at(i-1)[:draw]+1
            elsif j.winner=="L" then
              @teams.at(i-1)[:lose]= @teams.at(i-1)[:lose]+1
            end

         end
        end
        matches=Table.where("opponent_id = ? ",i)
        for j in matches
          if j.time < timeL || current_user.account_type == "Admin" then
            if j.winner=="L" then
              @teams.at(i-1)[:score]=@teams.at(i-1)[:score]+3
              @teams.at(i-1)[:win]= @teams.at(i-1)[:win]+1
            elsif j.winner=="D" then
              @teams.at(i-1)[:score]=@teams.at(i-1)[:score]+1
              @teams.at(i-1)[:draw]= @teams.at(i-1)[:draw]+1
            elsif j.winner=="W" then
              @teams.at(i-1)[:lose]= @teams.at(i-1)[:lose]+1
            end
         end
        end
      end
      @teams=@teams.sort_by{|hsh| hsh[:score]}
      @teams=@teams.reverse
      render :ranking
    else      
      render "new"
    end
  end
  
  def showFinal
    if current_user.account_type == "Admin" then
      render :final_matches
    else
      showNews
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
