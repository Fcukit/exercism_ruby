class BinarySearch
  attr_reader :list

  def initialize(list)
    @list = list
    raise ArgumentError, 'unsorted list given' if !sorted?
  end


  def search_for(x)
    while low <= high
      mid = middle
      if list[mid] == x
        reset_bounds
        return mid
      elsif x < list[mid]
        @high = mid - 1
      else
        @low = mid + 1
      end
    end
    reset_bounds
    raise 'not found'
  end

  def middle
    (high + low) / 2
  end

  private

  def reset_bounds
    @low = nil
    @high = nil
  end

  def low
    @low ||= 0
  end

  def high
    @high ||= list.size - 1
  end

  def sorted?
    list.each_cons(2).all? { |a, b| (a <= b) }
  end
end

