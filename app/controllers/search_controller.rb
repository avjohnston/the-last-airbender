class SearchController < ApplicationController
  def index
    @avatars = AvatarService.avatar_objects(params[:nation])
    @avatar_count = AvatarService.all_members_get(params[:nation]).size
  end
end
