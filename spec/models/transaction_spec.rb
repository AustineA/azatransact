require 'rails_helper'

RSpec.describe Transaction, type: :model do
  subject { 
    user = User.create!(first_name: "Austine", last_name: "Amah", email: "austine", password: "123456")
    described_class.new(
      user: user,
      input_amount: 5000*100,
      input_currency: "NGN",
      output_amount: 12*100,
      output_currency: "USD"
    ) 
  }

  context 'before transactions is created' do  
    it "must be associated to a User" do
      expect(described_class.reflect_on_association(:user).macro).to eq(:belongs_to) 
    end

    it "must have all required attributes present" do
      expect(subject).to be_valid
    end

    it "cannot be valid without an input_amount" do
      subject.input_amount = nil
      expect(subject).to_not be_valid
    end

    it "cannot be valid without an input_currency" do
      subject.input_currency = nil
      expect(subject).to_not be_valid
    end

    it "cannot be  valid without an output_currency" do
      subject.output_currency = nil
      expect(subject).to_not be_valid
    end
 
  end

end