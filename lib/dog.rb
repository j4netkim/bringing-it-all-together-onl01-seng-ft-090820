class Dog
  attr_accessor :id, :name, :breed


  def initialize(id: id, name:, breed:)
    @id = id
    @name = name
    @breed = breed
  end
end
