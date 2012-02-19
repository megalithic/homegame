class GamesController < ApplicationController
  def index
    @games = Game.all

    respond_to do |format|
      format.json { render :json => @games }
      format.html
    end
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
