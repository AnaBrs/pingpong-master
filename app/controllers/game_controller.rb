class GameController < ApplicationController
  def create
    @game = Game.new

    respond_to do |format|
      if @game.save
        format.html { redirect_to history_path(current_user), notice: 'Game was successfully created.' }
        format.json { render action: 'history', status: :created, location: @home }
      else
        format.html { render action: 'log' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

end
