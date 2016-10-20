class Event < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :joins, dependent: :destroy
  has_many :attendees, through: :joins, source: :user
end
