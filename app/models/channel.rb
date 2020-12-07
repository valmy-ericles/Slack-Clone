class Channel < ApplicationRecord
  belongs_to :team
  belongs_to :user
  has_many :messages, as: :messageable, dependent: :destroy

  validates_presence_of :slug, :team, :user
  validates :slug, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates_uniqueness_of :slug, scope: :team_id
end
