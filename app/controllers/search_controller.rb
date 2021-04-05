class SearchController < ApplicationController
  def index
    @avatars = AvatarsFacade.avatar_objects(params[:nation])
    @avatar_count = AvatarsFacade.nation_size(params[:nation])
  end
end
