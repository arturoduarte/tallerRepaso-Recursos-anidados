class Playlist < ApplicationRecord
  belongs_to :user
  has_many :songs
  validates :name, presence: true
  validates :name, uniqueness: true
end
