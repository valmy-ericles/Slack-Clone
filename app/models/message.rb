class Message < ApplicationRecord
  belongs_to :user
  belongs_to :messageable, polymorphic: true

  validates_presence_of :body, :user
end
