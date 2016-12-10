class HomeController < ApplicationController
  def index
    @users = User.all
  end

  def history
    @games = all_games(current_user)
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

  private
  
  def all_games(current_user)
    home_games1 = Game.where(home: current_user)
    home_games = home_games1.map {|h| {home: h.home, opponent: h.opponent, game_date: h.game_date, home_score: h.home_score, opponent_score: h.opponent_score}}
    opponent_games1 = Game.where(opponent: current_user)
    opponent_games = opponent_games1.map {|h| {home: h.opponent, opponent: h.home, game_date: h.game_date, home_score: h.opponent_score, opponent_score: h.home_score}}
    home_games + opponent_games
  end

end
