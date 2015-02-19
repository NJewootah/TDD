require 'date'
require 'pry'

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

  def remove_email(index)
    @emails.delete(index)
  end

  def add_phone_numbers(index)
    @phone_numbers << index
  end

  def remove_phone_numbers(index)
    @phone_numbers.delete(index)
  end

  def to_s()
    if @dob != nil
      puts "#{@fullname} was born on #{@dob}.His email addresses are 
      #{@emails}. His phone numbers are #{@phone_numbers}"
    else
      puts "The email addresses of #{@fullname} are #{@emails}. 
      His phone numbers are #{@phone_numbers}"
    end  
  end
end 

class FamilyMember < Person
  attr_accessor :relationship

  def initialize(relationship = "relative",*args)
    @relationship = relationship
    super
  end
end

class AddressBook
  attr_accessor :contacts

  def initialize()
    @contacts = []
  end

  def add(person)
    if person.is_a?Person
      @contacts << person
    else
      puts "Please use an object of Person"
    end
  end

  def list()
    puts "\n\nAddress Book:"
    puts "-------------"
    @contacts.each_with_index {|item, index|
    puts "Entry #{index + 1}: #{item.fullname}"}
  end

  def remove(fname)
    @contacts.each do |i|
      @contacts.each do |val|
        if val == fname
          @contacts.delete(i)
        end
      end
    end
  end
end