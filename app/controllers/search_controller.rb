class SearchController < ApplicationController
  def index
    @avatars = AvatarService.avatar_objects(params[:nation])
  end
end
