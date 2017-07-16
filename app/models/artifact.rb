class Artifact < ApplicationRecord
  validates :name, presence: true
end
