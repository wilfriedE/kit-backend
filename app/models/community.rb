class Community < ApplicationRecord
  validates :name, presence: true
  has_many :users

  def members
    users
  end

  def artifacts
    users.map(&:artifacts).uniq.flatten
  end
end
