class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :friendships
  has_many :friends,  -> { where "friendships.status = 'accepted'" }, through: :friendships
  has_many :requested_friends, -> { where "friendships.status = 'requested'" },through: :friendships, source: :friend
  has_many :pending_friends, -> { where "friendships.status = 'pending'" }, through: :friendships, source: :friend


  has_one :board, dependent: :destroy
  after_create :init_board
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def init_board
    Board.create(user_id: id)
  end

  def self.search(search)
    where("name LIKE ? OR email LIKE ?", "%#{search}%", "%#{search}%")
  end
end
