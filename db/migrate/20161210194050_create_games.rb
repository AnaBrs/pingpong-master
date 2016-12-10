class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references  :home,            null: false
      t.references  :opponent,        null: false
      t.date        :game_date,       null: false
      t.integer     :home_score,      null: false, default: 0
      t.integer     :opponent_score,  null: false, default: 0

      t.timestamps
    end
  end
end
