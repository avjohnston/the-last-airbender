class AvatarsFacade
  def self.avatar_objects(nation)
    AvatarService.nation_get(nation).map do |data|
      Avatar.new(data)
    end
  end


    def self.nation_size(nation)
      AvatarService.all_members_get(nation).size
    end
end
