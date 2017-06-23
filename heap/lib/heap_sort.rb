require_relative "heap"

class Array
  def heap_sort!
    2.upto(length) do |i|
      BinaryMinHeap.heapify_up(self,i-1,i)
    end
    length.downto(2) do |i|
      self[i-1], self[0] = self[0], self[i-1]
      BinaryMinHeap.heapify_down(self,0,i-1)
    end
    self.reverse!
  end
end
