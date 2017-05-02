class Pie
  attr_reader :flavor, :price
  
  def initialize(flavor, price)
    @flavor = flavor
    @price = price
  end

  def self.all
    @pies ||= []
  end

  def save
    return false unless valid?

    Pie.all << self
    true
  end

  def valid?
    valid = true

    if @flavor.empty?
      errors << "Username can't be blank"
      valid = false
    end

    if @price.empty?
      errors << "Password can't be blank"
      valid = false
    end

    valid
  end

  def errors
    @errors ||= []
  end

end
