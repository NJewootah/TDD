require 'spec_helper'

describe 'Person' do
  describe 'The person class is an addressbook entry' do
    it "should store and return personal information" do
      person = Person.new('Joe','Bloggs', '1 Jan 1990')

      #Expected outcomes
      expect(person.dob).to be_a(Date)
      expect(person.dob.to_s).to eq('1990-01-01')
      expect(person.fname).to eq('Joe')
      expect(person.sname).to eq('Bloggs')
      expect(person.fullname).to eq('Joe Bloggs')
    end

    it "should accept optional dates" do
      person = Person.new('Joe','Bloggs')

      #Expected outcomes
      expect(person.dob).to be_nil
    end

    it "should allow emails to be added to personal information" do
      person = Person.new('Joe','Bloggs')
      person.add_email('njewootah@yahoo.com')

      #Expected outcomes
      expect(person.emails).to be_a(Array)
      expect(person.emails[0]).to eq('njewootah@yahoo.com')
      expect(person.emails[1]).to be_nil
    end

    it "should allow phone numbers to be added to personal information" do
      person = Person.new('Joe','Bloggs')
      person.add_phone_numbers('02086414175')

      #Expected outcomes
      expect(person.phone_numbers).to be_a(Array)
      expect(person.phone_numbers[0]).to eq('02086414175')
      expect(person.phone_numbers[1]).to be_nil
    end
  end
end

