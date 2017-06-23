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
        if child_indexes.length > 1
          if prc.call(child_indexes[0],child_indexes[1]) >= 0
            swap_idx = child_indexes[1]
          else
            swap_idx = child_indexes[0]
          end
        else
          swap_idx = child_indexes[0]
        end
      else
        swap_idx = nil
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

  end

end
