class Bid < ApplicationRecord
  belongs_to :artifact
  belongs_to :user

  def bidder
    user
  end

  def as_json(options = { })
      h = super(options)
      h[:bidder] = bidder
      h
  end

end
