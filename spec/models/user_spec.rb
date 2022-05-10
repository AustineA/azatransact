require 'rails_helper'

RSpec.describe User, type: :model do
  subject { 
    described_class.new(password: "123456", email: "austine.amah@gmail.com")
  }

  describe "Validations" do

    it "must have all required attributes present" do
      expect(subject).to be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

  end

end
