class AvatarService
  def self.get_members
    response = conn.get("characters") do |request|
      request.params['character_id']
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.nation_get(nation)
    response = conn.get("characters?affiliation=#{nation.gsub('_', '+')}")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://last-airbender-api.herokuapp.com/api/v1/')
  end
end
