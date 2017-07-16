class Api::ArtifactsController < ApplicationController

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

  def update_artifact
    artifact.update!(artifact_attrs)
    success_resp('Artifact succesfully updated', artifact)
  end

  def search_for_artifacts
    Artifact.where('name like ? ', params[:name])
  end
end
