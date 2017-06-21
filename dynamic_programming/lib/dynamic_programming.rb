class DynamicProgramming
  def initialize
    @blair_cache = {1=>1, 2=> 2}
  end

  def blair_nums(n)
    return @blair_cache[n] if @blair_cache[n]
    third = (n.odd? ? n : n+1)
    ans = blair_nums(n-1) + blair_nums(n-2) + third
    @blair_cache[n] = ans
    @blair_cache[n]
  end

  def frog_hops(n)
  end

  def frog_cache_builder(n)
  end

  def frog_hops_top_down(n)
  end

  def super_frog_hops(n, k)
  end

  def make_change(amt, coins)
  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
