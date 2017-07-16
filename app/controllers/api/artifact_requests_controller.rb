class Api::ArtifactRequestsController < ApplicationController
    def index
      artifact_requests
    end

    def create
      failure_resp('Failed to create ArtifactRequest') unless create_artifact_request
    end

    def show
      render json: artifact_request
    end

    def update
      return update_artifact_request if artifact_request.present?
      failure_resp
    end

    def destroy
      destroy_artifact_request if artifact_request.present?
      failure_resp
    end

    private

    def artifact_requests
      render json: ArtifactRequest.where(user: api_user).all
    end

    def artifact_request
      return ArtifactRequest.find(params[:artifact_request]) if params[:artifact_request]
      {}
    end

    def artifact_request_attrs
      fields = {}
      fields.update(name: params[:name]) if params[:name]
      fields.update(description: params[:description]) if params[:description]
      fields.update(user: api_user)
      fields
    end

    def create_artifact_request
      item = ArtifactRequest.new(artifact_attrs)
      item.save!
      return success_resp('ArtifactRequest was successfully created', item)
    rescue Exception
      return false
    end

    def destroy_artifact_request
      artifact_request.destroy!
      return success_resp
    end

    def update_artifact_request
      artifact_request.update!(artifact_attrs)
      success_resp('Artifact succesfully updated', artifact)
    end

end
