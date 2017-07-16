class Api::ArtifactsController < ApplicationController

  def bid_show
    return failure_resp unless perform_bid
  end

  def bid_approval
    return failure_resp unless bid.present?
    approve_bid
  end

  def index
    render json: Artifact.all
  end

  def search
    render json: search_for_artifacts
  end

  def create
    failure_resp('Failed to create Artifact') unless create_artifact
  end

  def show
    render json: artifact
  end

  def user_artifacts
    render json: api_user.artifacts
  end

  def update
    return update_artifact if artifact.present?
    failure_resp
  end

  def destroy
    destroy_artifact if artifact.present?
    failure_resp
  end

  private

  def artifact
    return Artifact.find(params[:id]) if params[:id]
    {}
  end

  def artifact_attrs
    fields = {}
    fields.update(name: params[:name]) if params[:name]
    fields.update(condition: params[:condition]) if params[:condition]
    fields.update(cause_id: params[:cause_id]) if params[:cause_id]
    fields.update(user: api_user)
    fields
  end

  def bid
    return Bid.find(params[:bid_id]) if params[:bid_id]
    {}
  end

  def approve_bid
    bid.update!({approved: true})

    artifact.bids.each do |b|
      bid.destroy! unless b == bid
    end
    artifact.update!({reserved: true})
    return success_resp('Artifact succesfully reserved', artifact)
  end

  def bid_attrs
    fields = {user: api_user, artifact: artifact}
    fields.update(price: params[:price]) if params[:price]
    fields
  end

  def create_artifact
    item = Artifact.new(artifact_attrs)
    item.save!
    return success_resp('Artifact was successfully created', item)
  rescue Exception
    return false
  end

  def destroy_artifact
    artifact.destroy!
    return success_resp
  end

  def perform_bid
    return success_resp if Bid.new(bid_attrs).save!
  end

  def update_artifact
    artifact.update!(artifact_attrs)
    success_resp('Artifact succesfully updated', artifact)
  end

  def search_for_artifacts
    Artifact.where("name like ?", "%#{params[:name]}%")
  end
end
