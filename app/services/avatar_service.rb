class AvatarService
  def self.nation_get(affiliation)
    response = conn.get('characters') do |f|
      f.params['affiliation'] = affiliation.gsub('_', '+')
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://last-airbender-api.herokuapp.com/api/v1/')
  end
end
