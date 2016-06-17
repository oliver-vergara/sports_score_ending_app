class User < ActiveRecord::Base
  
  has_many :bets
  has_many :games, through: :bets
  has_many :combos, through: :bets 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, uniqueness: true
end
