class Note < ActiveRecord::Base
  belongs_to :user
  # validates :title, presence: true
  validates :content,
             presence: true,
             length: { maximum: 140}
  validates :user_id, presence: true
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
end
