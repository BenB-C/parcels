require('pry')

class Parcel
  @@parcels = {}
  @@id = 0

  attr_reader :cost

  def initialize(height, length, width, weight)
    @volume = height * length * width
    @weight = weight
    @cost = @volume * @weight
    binding.pry
    @id = @@id += 1
    self.calculateCost
    self.save
  end

  def save
    @@parcels[@id] = self
  end

  def calculateCost
    @cost = @volume * @weight
  end

  def self.all()
    @@parcels.values()
  end

  def self.find(id)
    @@parcels[id]
  end

  def self.delete(id)
    @@parcels.delete(id)
  end


end
