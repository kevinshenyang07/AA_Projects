class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
    arr = []
    self.my_each do |x|
      arr.push(x) if prc.call(x)
    end
    arr
  end

  def my_reject(&prc)
    arr = []
    self.my_each do |x|
      arr.push(x) if !prc.call(x)
    end
    arr
  end

  def my_any?(&prc)
    self.my_each do |x|
      return true if prc.call(x)
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |x|
      return false if !prc.call(x)
    end
    true
  end

  def my_flatten
    arr = []

    self.my_each do |x|
      if x.is_a?(Array)
        x = x.my_flatten
        arr += x
      else
        arr << x
      end
    end
    arr
  end

  def my_zip(*args)
    new_arr = []
    (0..self.length-1).to_a.my_each do |idx|
      arr = [self[idx]]
      args.my_each do |el|
        arr << el[idx]
      end
      new_arr << arr
    end
    new_arr
  end



  def my_rotate(shift=1)
    while shift < 0
      shift += self.length
    end
      self[shift%self.length..-1] + self[0...shift%self.length]
  end

  def my_join(sep='')
    str = ''
    self.my_each do |char|
      str += char
      str += sep
    end
    str[0..(-sep.length-1)]
  end

def my_reverse
  new_arr = []
  while !self.empty?
    new_arr << self.pop
  end
  new_arr
end
end
