class Artifact < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many :bids
  has_many :bidders, through: :bids, source: :user

  def community
    user.community
  end

  def cause
    return Cause.find(cause_id) if cause_id
  end

  def as_json(options = { })
      h = super(options)
      h[:community] = community
      h[:bids] = bids
      h[:image_url] = "http://lorempixel.com/100/100/cats/" unless image_url
      h
  end
end
