class Guess < ActiveRecord::Base
belongs_to :user_id
belongs_to :posts

has_many :points

end
