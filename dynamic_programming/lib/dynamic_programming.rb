class DynamicProgramming
  def initialize
    @blair_cache = {1=>1, 2=> 2}
    @frog_cache = {1=>[[1]], 2=>[[1,1],[2]], 3=>[[1, 1, 1], [1, 2], [2, 1],[3]]}
  end

  def blair_nums(n)
    return @blair_cache[n] if @blair_cache[n]
    ans = blair_nums(n-1) + blair_nums(n-2) + ((n-1)*2+1)
    @blair_cache[n] = ans
    @blair_cache[n]
  end

  def frog_hops(n)
    return nil if n > 999
    # cache = frog_cache_builder(n)
    # cache[n]
    frog_hops_top_down(n)
  end

  def frog_cache_builder(n)
    cache = {1=>[[1]], 2=>[[1,1],[2]], 3=>[[1, 1, 1], [1, 2], [2, 1],[3]]}
    return cache if n <= 3
    (4..n).step do |idx|
      cache_1 = cache[idx-1].map {|arr| arr + [1] }
      cache_2 = cache[idx-2].map {|arr| arr + [2] }
      cache_3 = cache[idx-3].map {|arr| arr + [3] }
      cache[idx] = cache_1 + cache_2 + cache_3
    end
    cache
  end

  def frog_hops_top_down(n)
    return @frog_cache[n] if @frog_cache[n]
    p n
    cache_1 = frog_hops_top_down(n-1).map {|arr| arr + [1] }
    cache_2 = frog_hops_top_down(n-2).map {|arr| arr + [2] }
    cache_3 = frog_hops_top_down(n-3).map {|arr| arr + [3] }
    @frog_cache[n] = cache_1 + cache_2 + cache_3
    @frog_cache[n]

  end

  def super_frog_hops(n, k)
  end

  def make_change(amt, coins)
  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
