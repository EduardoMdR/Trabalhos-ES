class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s
    attr_reader attr_name
    class_eval %Q{
      def #{attr_name}_history
        @#{attr_name}_history || [nil] # give default value if not assigned
      end

      def #{attr_name}=(new_value)
        @#{attr_name}_history ||= [nil] # shortcut, compare to your line
        @#{attr_name}_history << @#{attr_name} = new_value
      end
    }
  end
end

class Example
  attr_accessor_with_history :foo
  attr_accessor_with_history :bar
end

a = Example.new; a.foo = 2; a.foo = "test"; 
puts "#{a.foo_history}" # => [nil, 2, "test"]

a = Example.new
puts "#{a.foo_history}" # => [nil]

f = Example.new # => # <Foo: 0x127e678>
f.bar = 3 # => 3
f.bar = :wowzo # =>: wowzo
f.bar = 'boo!' # => 'boo!'
puts "#{f.bar_history}"  # => [nulo, 3,: wowzo, 'boo!']