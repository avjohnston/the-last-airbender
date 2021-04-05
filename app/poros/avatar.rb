class Avatar
  attr_reader :id,
              :name,
              :photo_link,
              :allies,
              :enemies,
              :affiliations

  def initialize(data)
    @id = data[:_id]
    @name = data[:name]
    @photo_link = data[:photoUrl]
    @allies = data[:allies]
    @enemies = data[:enemies]
    @affiliations = data[:affiliation]
  end

  def allies
    if @allies.empty?
      ["None"]
    else
      @allies
    end
  end

  def enemies
    if @enemies.empty?
      ["None"]
    else
      @enemies
    end
  end
end
