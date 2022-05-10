require 'rails_helper'

RSpec.describe Transaction, type: :model do
  subject { 
    user = User.create!(first_name: "Austine")
    described_class.new(
      user: user,
      input_amount: 5000*100,
      input_currency: "NGN",
      output_amount: 12*100,
      output_currency: "USD"
    ) 
  }

  it "should belong to a user" do
    expect(described_class.reflect_on_association(:user).macro).to eq(:belongs_to) 
  end

  it "is valid with all valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without an input_amount" do
    subject.input_amount = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an input_currency" do
    subject.input_currency = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an output_amount" do
    subject.output_amount = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an output_currency" do
    subject.output_currency = nil
    expect(subject).to_not be_valid
  end
 
end