class Artifact < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many :bids
  has_many :bidders, through: :bids, source: :user

  def community
    user.community
  end

  def as_json(options = { })
      h = super(options)
      h[:community] = community
      h[:bids] = bids
      h
  end
end
