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

  def all_games(user)
    home_games = Game.where(home: user).map {|h| {home: h.home,
                  opponent: h.opponent, game_date: h.game_date,
                  home_score: h.home_score, opponent_score: h.opponent_score}}
    opponent_games = Game.where(opponent: user).map {|h| {home: h.opponent,
                      opponent: h.home, game_date: h.game_date,
                      home_score: h.opponent_score, opponent_score: h.home_score}}
    home_games + opponent_games
  end
  helper_method :all_games

end
