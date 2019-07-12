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
  
  def save (name, type, db)
  sql = "INSERT INTO pokemon (name, type)
    VALUES (?, ?)"
    
    db[:conn].execute(sql, self.name, self.type)
  end
  
  def self.find (id_num, db)
    details = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num)
    Pokemon.new(id: details[0], name: details[1], type: details[2], db: db)
end

end
