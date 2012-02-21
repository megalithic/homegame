class VotesController < ApplicationController
  def index
    @player = Player.new
    @votes = Vote.all
  end

  def create
    @vote = Vote.new(params[:vote])
    @vote.player_id = session[:player_id]
    @vote.week_number = Date.current.next_week.strftime("%W")
    respond_to do |format|
      if !player_voted?
        if @vote.save
          format.html { redirect_to(root_url, :notice => 'Your vote has been added to the mix.') }
          format.json { render :json => @vote}
        else
          format.html { redirect_to root_url, :alert => "There was a problem with putting your vote into the pot. Give it another shot." }
          format.json { render :json => @vote.errors.to_a, :status => :unprocessable_entity }
        end
      else
          format.html { redirect_to root_url, :alert => "You are only allowed to vote once per game week." }
          format.json { render :json => @vote.errors.to_a, :status => :unprocessable_entity }
      end
    end
  end
end