class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friendships
  has_many :other_friendships, foreign_key: 'friend_id', class_name: 'Friendship'

  def total_friends
    friends_total = []
    friendships.each do |friend|
      friends_total.push(friend.friend) if friend.status
    end
    other_friendships.each do |friend|
      friends_total.push(friend.user) if friend.status
    end
    friends_total
  end

  def sent_friends_request
    friends_total = []
    friendships.each do |friend|
      friends_total.push(friend.friend) unless friend.status
    end

    friends_total
  end

  def recieved_friend_request
    friends_total = []
    other_friendships.each do |friend|
      friends_total.push(friend.user) unless friend.status
    end
    friends_total
  end

  def confirm_request(user)
    friendship = other_friendships.find { |friend| friend.user_id == user }
    friendship.status = true
    friendship.save
  end

  def rollback_request(user)
    friendship = friendships.find { |friend| friend.friend_id == user }
    friendship.status = false
    friendship.save
  end

  def friend?(user)
    total_friends.include?(user)
  end
end
