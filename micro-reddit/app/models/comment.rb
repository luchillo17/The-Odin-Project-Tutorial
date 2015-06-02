class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates_presence_of :user, :post

  validates :comment, presence: true,
  										length: {minimum: 5, maximum: 255}
end
