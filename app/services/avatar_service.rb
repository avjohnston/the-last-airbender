class AvatarService
  def self.get_members
    response = conn.get("characters") do |request|
      request.params['character_id']
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.nation_get(nation)
    response = conn.get("characters?affiliation=#{nation.gsub('_', '+')}&perPage=25")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.all_members_get(nation)
    response = conn.get("characters?affiliation=#{nation.gsub('_', '+')}&perPage=150")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://last-airbender-api.herokuapp.com/api/v1/')
  end

  def self.avatar_objects(nation)
    nation_get(nation).map do |data|
      Avatar.new(data)
    end
  end
end
