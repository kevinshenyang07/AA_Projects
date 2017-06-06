class Employee

  attr_reader :salary

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end

end

class Manager < Employee

  attr_accessor :subs

  def initialize(name, title, salary, boss, subs=[])
    super(name, title, salary, boss)
    @subs = subs
  end

  def bonus(multiplier)
    total = @subs.map {|obj| obj.salary}.reduce(:+)
    total * multiplier
  end

end

ned = Manager.new('Ned', 'Founder', 1000000, nil)
darren = Manager.new('Darren', 'TA Manager', 78000, ned)
shawna = Employee.new('Shawna', 'TA', 12000, darren)
david = Employee.new('David', 'TA', 10000, darren)

ned.subs += [darren, shawna, david]
darren.subs += [shawna, david]

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
