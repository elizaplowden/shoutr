class Shout < ApplicationRecord
  belongs_to :user
  belongs_to :content, polymorphic: true
  validates :user, presence: true

  default_scope { order(created_at: :desc) }

  # provides additional meaning. username comes from user, so we can call it on shouts
  delegate :username, to: :user
end
