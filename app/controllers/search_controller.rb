class SearchController < ApplicationController
  def index
    @avatars = AvatarService.nation_get(params[:nation])
  end
end
