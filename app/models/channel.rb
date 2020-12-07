class Channel < ApplicationRecord
  belongs_to :team
  belongs_to :user
  has_many :messages, as: :messageable, dependent: :destroy

  validates_presence_of :slug, :team, :user
  validates :slug, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
end
