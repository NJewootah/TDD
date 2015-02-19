require 'spec_helper'

describe 'Person' do

  let(:dob){'1990-01-01'}
  let(:fname){'Joe'}
  let(:sname){'Bloggs'}
  let(:fullname){'Joe Bloggs'}
  let(:email){'njewootah@yahoo.com'}
  let(:phone){'02086414175'}
  let(:person){Person.new(fname,sname,dob)}

  describe 'The person class is an addressbook entry' do
    it "should store and return personal information" do
      expect(person.dob).to be_a(Date)
      expect(person.dob.to_s).to eq(dob)
      expect(person.fname).to eq(fname)
      expect(person.sname).to eq(sname)
      expect(person.fullname).to eq(fullname)
    end

    it "should accept optional dates" do
      person = Person.new(fname,sname)
      expect(person.dob).to be_nil
    end

    #it "should raise an error if full name is not provided" do
      #expect(Person.new(fname)).to raise_error(ArgumentError)
      #expect(Person.new('',sname)).to raise_error(ArgumentError)
    #end

    it "should allow emails to be added to personal information" do
      expect(person.emails).to eq(Array.new)
      person.add_email(email)
      expect(person.emails[0]).to eq(email)
      expect(person.emails[1]).to be_nil
    end

    it "should allow emails to be removed from personal information" do
      person.add_email(email)
      person.remove_email(email)
      expect(person.emails).to eq(Array.new)
    end

    it "should allow phone numbers to be added to personal information" do
      expect(person.phone_numbers).to eq(Array.new)
      person.add_phone_numbers(phone)
      expect(person.phone_numbers[0]).to eq(phone)
      expect(person.phone_numbers[1]).to be_nil
    end

    it "should allow phone numbers to be removed from personal information" do
      person.add_phone_numbers(phone)
      person.remove_phone_numbers(phone)
      expect(person.phone_numbers).to eq(Array.new)
    end
  end
end

describe 'FamilyMember' do
  let(:rel){'Father'}
  let(:dob){'1990-01-01'}
  let(:fname){'Joe'}
  let(:sname){'Bloggs'}
  let(:family){FamilyMember.new(fname,sname,dob)}

  describe 'The FamilyMember class is a child of the Person class' do
    it "should store the relationship status between Person objects" do
      family.relationship = rel
      expect(family.relationship).to eq(rel)
      expect(family.fname).to eq(fname)
      expect(family.sname).to eq(sname)
      expect(family.dob.to_s).to eq(dob)
      expect(FamilyMember < Person).to be true
    end
  end
end

describe 'AddressBook' do
  let(:dob){'1990-01-01'}
  let(:fname){'Joe'}
  let(:sname){'Bloggs'}
  let(:person){Person.new(fname,sname,dob)}
  let(:person2){Person.new(fname,sname,dob)}
  let(:fullname){fname + ' ' + sname}

  describe 'The AddressBook class contains all contact information for all Person objects' do
    it "should allow entry of contacts" do
      book = AddressBook.new
      expect(book.contacts).to eq(Array.new)
      book.add(person)
      expect(person.class).to eq(Person)
      expect(book.contacts[0]).to eq(person)
    end

    #it "should display all entries of contacts" do
      #book = AddressBook.new
      #book.add(person)
      #book.add(person2)
      #expect(book.list[0]).to eq(person.fullname)
      #expect(book.list[1]).to eq(person2.fullname)
    #end

    it "should allow the removal of contacts" do
      book = AddressBook.new
      book.remove('Joe')
      expect(book.contacts).not_to include('Joe Bloggs')
    end
  end
end
