class Dessert
  attr_accessor :name
  attr_accessor :calories
  
  def initialize(name, calories)
    @name=name
    @calories=calories
  end
  
  def healthy?
     @calories<200 
  end

  def delicious?
    true
  end
end

class JellyBean < Dessert
  attr_accessor :flavor
  def initialize(name, calories, flavor)
    @name=name 
    @calories=calories
    @flavor=flavor
  end
  
  def delicious?
    if @flavor== "black licorice"
      false
    else
      true
    end
  end
end

a=JellyBean.new("a",232,"asd")
p a.delicious?
p a.healthy?
b=Dessert.new("asd",190)
p b.delicious?
p b.healthy?