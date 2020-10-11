require 'pry'
class Dog
  attr_accessor :id, :name, :breed


  def initialize(id: id, name: name, breed: breed)
    @id = id
    @name = name
    @breed = breed
  end


  def self.create_table
    db.execute("INSERT INTO dogs ")
  end


  def self.drop_table
    sql = <<-SQL
    DROP TABLE IF EXISTS dogs
    SQL
    DB[:conn].execute(sql)
  end


  def self.new_from_db(row)
    new_dog = self.new
    new_dog.id = row[0]
    new_dog.name = row[1]
    new_dog.breed = row[2]
    new_dog
  end


#   def self.save
#     sql = <<-SQL
#     INSERT INTO dogs (name, breed) VALUES (?, ?)
#     SQL
#     DB[:conn].execute(sql, self.name, self.breed)
#     binding.pry
#     @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
#   end
# end
