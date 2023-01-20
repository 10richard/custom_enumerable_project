module Enumerable
  
  def my_all?
    cond = false
    for item in self
      cond = yield item
      cond == false ? break : next
    end
    cond
  end

  def my_any?
    cond = false
    for item in self
      cond = yield item
      cond == true ? break : next
    end
    cond
  end

  def my_count
    return self.length unless block_given?

    count = 0
    for item in self
      if yield item
        count += 1
      end
    end
    count
  end

  def my_each_with_index
    return self unless block_given?

    i = 0
    for item in self
      yield item, i
      i += 1
    end
  end

  def my_inject(initial_val)
    return self unless block_given?

    for item in self
      initial_val = yield(initial_val, item)
    end
    initial_val
  end

  def my_map
    return self unless block_given?

    arr = []
    for item in self
      arr.append(yield item)
    end
    arr
  end

  def my_none?
    return self unless block_given?

    cond = false
    for item in self
      cond = yield item
      cond == true ? break : next
    end
    !cond
  end

  def my_select
    return self unless block_given?

    arr = []
    for item in self
      cond = yield item
      cond ? arr.append(item) : next
    end
    arr
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for item in self
      yield item
    end
  end
end