module Enumerable
  def my_each
    array = self
    (0..array.length-1).each do |i|
      yield(array[i])
    end
  end

  def my_each_with_index
    array = self
    (0..array.length-1).each do |i|
      yield(array[i], i)
    end
  end

  def my_select
    array = self
    new_array = []
    (0..array.length-1).each do |i|
      new_array << array[i] if yield(array[i]) == true
    end
    new_array
  end

  def my_all?
    array = self
    (0..array.length-1).each do |i|
      return false if yield(array[i]) == false
    end
    true
  end

  def my_any?
    array = self
    (0..array.length-1).each do |i|
      return true if yield(array[i]) == true
    end
    false
  end

  def my_none?
    array = self
    (0..array.length-1).each do |i|
      return false if yield(array[i]) == true
    end
    true
  end

  def my_count
    array = self
    count = 0
    (0..array.length-1).each do |i|
      count += 1 if yield(array[i]) == true
    end
    count
  end

  def my_map
    array = self
    (0..array.length-1).each do |i|
      array[i] = yield(array[i])
    end
    array
  end

  def my_map(proc = nil)
    array = self
    new_array = []
    (0..array.length-1).each do |i|
      if proc and block_given?
        new_array << yield(proc.call(array[i]))
      elsif proc
        new_array << proc.call(array[i])
      elsif block_given?
        new_array << yield(array[i])
      else
        return array
      end
    end
    new_array
  end

  def my_inject(array = nil)
    array = self
    total = 0
    if array == nil
      total = 0
    else
      total = 1
    end
    (0..array.length-1).each do |i|
      total = yield(total, array[i])
    end
    total
  end

  def multiply_els
    array = self
    total = 1
    (0..array.length-1).each do |i|
      total = yield(total, array[i])
    end
    total
  end
end

puts "my_each test:"
array = [1,2,3,4]
array.my_each do |i|
  puts i
end

puts "\n"
puts "my_each_with_index test:"
index_array = ["hi", "hey", "sup", "yo", "hello"]
index_array.my_each_with_index do |v, i|
  puts v, i
end

puts "\n"
puts "my_select test:"
select_array = [1,2,3,4,5,6,7]
puts select_array.my_select {|n| n.odd?}

puts "\n"
puts "my_all? test:"
all_array = ["wtf", "lol", "g2g"]
puts all_array.my_all? {|word| word.length == 3}

puts "\n"
puts "my_any? test:"
any_array = [1,2,3,4,5]
puts any_array.my_any? {|n| n >= 5}

puts "\n"
puts "my_none? test:"
none_array = [1,2,3,4,5]
puts none_array.my_none? {|n| n >= 5}

puts "\n"
puts "my_count test:"
count_array = [1,2,3,4,5]
puts count_array.my_count {|n| n > 2}

puts "\n"
puts "my_map test:"
map_array = [1,2,3,4,5]
puts map_array.my_map {|n| n*n}

puts "\n"
puts "my_map text without block"
puts map_array.my_map

puts "\n"
puts "my_inject test:"
inject_array = [1,2,3,4,5]
puts inject_array.my_inject {|total, n| total * n}

puts "\n"
puts "multiply_els test:"
els_array = [2,4,5]
puts els_array.multiply_els {|total, n| total * n}
