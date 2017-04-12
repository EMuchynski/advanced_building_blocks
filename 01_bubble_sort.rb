#Build a method #bubble_sort that takes an array and returns a sorted array.

def bubble_sort(arr)
  while true
    swapped = false
    (0..arr.length-2).each do |i|
      if arr[i] > arr[i+1]
        arr[i], arr[i+1] = arr[i+1], arr[i]
        swapped = true
      end
    end
    break if swapped == false
  end
  arr
end

puts bubble_sort([4,3,78,2,0,2]) #[0,2,2,3,4,78]

#Create a similar method called #bubble_sort_by which sorts an array but accepts a block.

def bubble_sort_by(arr)
  if block_given?
    while true
      swapped = false
      (0..arr.length-2).each do |i|
        if yield(arr[i], arr[i+1]) > 0
          arr[i], arr[i+1] = arr[i+1], arr[i]
          swapped = true
        end
      end
      break if swapped == false
    end
  else
    puts "No block given"
    bubble_sort(arr)
  end
  arr
end

puts bubble_sort_by(["hi","hello","hey"]) { |left,right| left.length - right.length} #["hi", "hey", "hello"]
