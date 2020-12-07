class TeamUser < ApplicationRecord
  belongs_to :user
  belongs_to :team

  validates_presence_of :team, :user
end
