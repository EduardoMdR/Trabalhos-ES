class CartesianProduct

  include Enumerable

  def initialize(x, y)
    @result = []
    x.each do |l|
      y.each do |r|
        @result.push([l, r])
      end
    end
  end

  def each
    @result.each { |i| yield i }
  end
end

#Examples of use
c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]
c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
# (nothing printed since Cartesian product
# of anything with an empty collection is empty)