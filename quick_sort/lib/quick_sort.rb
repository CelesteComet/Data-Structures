class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length < 2
    pivot = array[0]
    left = []
    right = []
    array.drop(1).each do |num|
      if num <= pivot
        left.push(num)
      else
        right.push(num)
      end
    end
    return QuickSort.sort1(left) + [pivot] + QuickSort.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
  end

# Partitioning is shifting less than and greater than
  def self.partition(array, start, length, &prc)
  end
end

p QuickSort.sort1([10,2,4,3,5,7,6])
