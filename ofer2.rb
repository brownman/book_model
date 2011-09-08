

puts 'hello'


class A
  attr_accessor :a
  def initialize str
    @a = str
  end
  #this is a nice information to this function: nice
  def self.nice?
    puts 'nice!'
  end

end

a1 = A.new 'hello'

def a1.think
  puts 'think!'
end

puts a1
a1.inspect
