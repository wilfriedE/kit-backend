class Artifact < ApplicationRecord
  validates :name, presence: true
  belongs_to :user

  def community
    user.community
  end
end
