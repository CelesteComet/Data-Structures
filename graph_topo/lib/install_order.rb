# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to



def install_order(arr)
  max_id = arr.flatten.max
  packages = (1..max_id).to_a
  sorted = find_no_dependencies(arr, packages)
  until sorted.length == max_id
    arr.reject! {|el| sorted.include?(el[1]) }
    if arr.empty?
      sorted += packages-sorted
      break
    end
    no_dependents = packages - arr.transpose[0]
    sorted += (no_dependents-sorted)
  end
  sorted
end

def find_no_dependencies(arr, packages)
  dependents = arr.transpose[0]
  packages - dependents
end
