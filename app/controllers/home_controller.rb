class HomeController < ApplicationController
  def index
    @users = User.all
  end

  def history
    @games = Game.where(home: current_user)
  end

  def log
    @game = Game.new
    @user = current_user
    @opponents = User.where.not(id: current_user.id)
  end

  def winner_result(home_score, opponent_score)
    return 'W' if home_score > opponent_score
    return 'L' if home_score < opponent_score
  end
  helper_method :winner_result

end
