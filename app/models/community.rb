class Community < ApplicationRecord
  validates :name, presence: true
  has_many :users
  has_many :causes

  def members
    users
  end

  def artifacts
    users.map(&:artifacts).uniq.flatten
  end
end
