require 'date'

class Person
  attr_accessor :dob,:fname,:sname
  attr_reader :emails, :phone_numbers

  def initialize(fname,sname,dob='')
    if dob != ''
      @dob = Date.parse(dob)
    else
      @dob = nil
    end
    @fname = fname
    @sname = sname
    @emails = []
    @phone_numbers = []
  end

  def fullname
    "#{@fname} #{@sname}"
  end

  def add_email(index)
    @emails << index
  end

  def add_phone_numbers(index)
    @phone_numbers << index
  end
end 