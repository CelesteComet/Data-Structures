class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = store
    @prc = prc
  end

  def count
    @store.length
  end

  def extract

  end

  def swap(first_idx, second_idx)

  end

  def peek

  end

  def push(val)

  end

  public
  def self.child_indices(len, parent_index)
    if parent_index*2+1 > len-1
      return nil
    elsif parent_index*2+2 > len-1
      return [2*parent_index+1]
    else
      return [2*parent_index+1,2*parent_index+2]
    end
  end

  def self.parent_index(child_index)
    parent = (child_index-1)/2
    raise "root has no parent" if parent < 0
    parent
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new {|el,el2| el <=> el2 }
    swap = true
    while swap
      swap = false
      child_indexes = BinaryMinHeap.child_indices(len, parent_idx)
      if child_indexes
        swap_idx = child_indexes[0]
        if child_indexes.length > 1 && prc.call(array[child_indexes[0]],array[child_indexes[1]]) > 0
          swap_idx = child_indexes[1]
        end
      end

      if swap_idx && prc.call(array[parent_idx],array[swap_idx]) > 0
        array[swap_idx], array[parent_idx] = array[parent_idx], array[swap_idx]
        swap = true
      end

      parent_idx = swap_idx
    end
    array

  end

  def self.find_child_index(array,child_indexes,&prc)

  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new {|el,el2| el <=> el2 }
    parent_idx = BinaryMinHeap.parent_index(child_idx)
    if prc.call(array[child_idx], array[parent_idx]) < 0
      array[parent_idx], array[child_idx] = array[child_idx], array[parent_idx]
    else
      return
    end
    heapify_up(array, parent_idx, array.length, &prc) if parent_idx != 0
    array
  end

end
