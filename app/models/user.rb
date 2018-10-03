class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :board, dependent: :destroy
  after_create :init_board
  has_many :posts
  #has_many :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def init_board
    Board.create(user_id: id)
  end

end
