class Game < ActiveRecord::Base
  belongs_to :home,     class_name: "User"
  belongs_to :opponent, class_name: "User"
end
