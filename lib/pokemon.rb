# class Pokemon
#
#   @@all = []
#
#    attr_accessor :id, :name, :type, :db, :hp
#
#   def initialize(id: nil, name:, type: , db:, hp: 60)
#       @id = id
#       @name = name
#       @type = type
#       @db = db
#       @@all << self
#     end
#
#     def self.save(name, type, db)
#    db.execute("INSERT INTO pokemon(name, type) VALUES(?, ?)", [name, type])
#
#  end
#
#  def self.save(name, type, db)
#  data = db.prepare("INSERT INTO pokemon (name, type) VALUES (?,?)")
#  data.execute(name,type)
# end
#
# def self.find(id, db)
#  data = db.prepare("SELECT * FROM pokemon WHERE id = ?")
#  result_set = data.execute(id)
#
#  results = result_set.collect do |row|
#    pokemon = Pokemon.new(name: row[1], type: row[2], db: db, id: id)
#    pokemon.hp = row[3]
#    pokemon
#  end
#  results[0]
# end
#  # def find(id, db)
#  #      db.execute("SELECT * FROM pokemon WHERE id = ?", [id])[0]
#  #      #create_or_update_from_data({id: data[0], name: data[1], type: data[2], db: db, hp: data[3]})
#  #      id_, name, type, hp = result
#  #    # db.execute("UPDATE pokemon SET hp = ? WHERE id = ?",60,id_) if result.length != 3
#  #    new(id: id_, name: name, type: type,db: db, hp: hp)
#  #    end
#
#  def alter_hp(new_val, db)
#      db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", [new_val, self.id])
#   end
# end


class Pokemon
 attr_accessor :id, :name, :type, :hp, :db

 def self.save(name, type, db)
   db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
 end

 def self.find(id_num, db)
   pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
   Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], hp: pokemon_info[3], db: db)
 end

 def initialize(id:, name:, type:, hp: nil, db:)
   @id, @name, @type, @hp, @db = id, name, type, hp, db
 end

 #def alter_hp(new_hp, db)
  # db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
 #end
end
