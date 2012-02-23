class VotesController < ApplicationController
  def index
    @player = Player.new
    @votes = Vote.all
  end

  def create
    @vote = Vote.new(params[:vote])
    @vote.player_id = session[:player_id]
    @vote.week_number = Date.current.next_week.strftime("%W")
    @vote.is_playing = true
    respond_to do |format|
      if !player_voted?
        if @vote.save
          format.html { redirect_to root_url, :notice => 'Your vote has been added to the mix.' }
          format.json { render :json => @vote}
        else
          format.html { redirect_to root_url, :flash => {:alert => "There was a problem with putting your vote into the pot. Give it another shot."} }
          format.json { render :json => @vote.errors.to_a, :status => :unprocessable_entity }
        end
      else
          format.html { redirect_to root_url, :flash => {:alert => "You are only allowed to vote once per game week."} }
          format.json { render :json => @vote.errors.to_a, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @vote = Vote.find(params[:id])
    @vote.is_playing = false
    respond_to do |format|
      if @vote.update_attributes(params[:vote])
        format.html { redirect_to root_url, :notice => 'You are no longer playing next week.' }
        format.json { render :json => @vote}
      else
        format.html { redirect_to root_url, :flash => {:alert => "There was a problem with removing your vote and seat reservation."} }
        format.json { render :json => @vote.errors.to_a, :status => :unprocessable_entity }
      end
    end
  end

  def reset_is_playing(week_number)
    Vote.update_all :is_playing => false, :conditions => ["week_number = ?", week_number]
  end
end