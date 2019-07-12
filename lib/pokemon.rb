class Pokemon
  
  attr_accessor :name, :type, :id, :db
   @@all = []


  def initialize (id: nil, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end
  
   def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find (num, db)
    details = db.execute("SELECT * FROM pokemon WHERE id = ?", num).flattem
    Pokemon.new(id: details[0], name: details[1], type: details[2], db: db)
end

end
