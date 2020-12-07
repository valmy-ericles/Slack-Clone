class Team < ApplicationRecord
  belongs_to :user
  has_many :talks
  has_many :channels
  has_many :team_users
  has_many :users, through: :team_users

  validates_presence_of :user, :slug
  validates :slug, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
end
