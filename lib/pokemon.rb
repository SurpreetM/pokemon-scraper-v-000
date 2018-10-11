class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:, hp: = nil)
      @id, @name, @type, @db, @hp = id, name, type, db, hp
    end

  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find (id, db)
    info = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: info[0], name: info[1], type: info[2], db: db)
  end



end
