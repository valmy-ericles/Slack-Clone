class Team < ApplicationRecord
  belongs_to :user
  has_many :talks
  has_many :channels, dependent: :detroy
  has_many :team_users, dependent: :destroy
  has_many :users, through: :team_users

  validates_presence_of :user, :slug
  validates :slug, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }

  before_save :general_channel

  def general_channel
    channels << Channel.create(slug: 'general', user: user)
  end
end
