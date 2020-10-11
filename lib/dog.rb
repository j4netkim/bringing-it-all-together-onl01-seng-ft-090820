require 'pry'
class Dog
  attr_accessor :id, :name, :breed


  def initialize(id: id, name: name, breed: breed)
    @id = id
    @name = name
    @breed = breed
  end


  def self.create_table
    sql = <<-SQL
    CREATE TABLE IF NOT EXISTS dogs (
      id INTEGER PRIMARY KEY,
      name TEXT,
      breed TEXT
    )
    SQL
    DB[:conn].execute(sql)
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


  def self.save
    sql = <<-SQL
    INSERT INTO dogs (name, breed) 
    VALUES (?, ?)
    SQL
    DB[:conn].execute(sql, self.name, self.breed)
  end
end
