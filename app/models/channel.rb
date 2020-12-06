class Channel < ApplicationRecord
  belongs_to :team
  belongs_to :user
  has_many :messages, as: :messageable, dependent: :destroy

  validates_presence_of :slug, :team, :user
end
