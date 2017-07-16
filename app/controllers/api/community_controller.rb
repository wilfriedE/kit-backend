class Api::CommunityController < ApplicationController

  def artifacts
    render json: community_artifacts
  end

  def causes
    render json: community_causes
  end

  def index
    render json: Community.all
  end

  def search
    render json: search_for_communities
  end

  def show
    render json: community
  end

  private

  def community
    return Community.find(params[:id]) if params[:id]
    {}
  end

  def community_artifacts
    community.artifacts
  end

  def community_causes
    community.causes
  end

  def search_for_communities
    Community.where("name like ?", "%#{params[:name]}%")
  end
end
