RSpec.shared_examples "a valid UK postcode" do |klass|
  it "accepts valid postcodes" do
    model = klass.new(postcode: "SW1A 1AA")
    model.valid?

    expect(model.errors[:postcode]).to be_empty
  end

  it "rejects invalid postcodes" do
    model = klass.new(postcode: "Invalid postcode")
    model.valid?

    expect(model.errors[:postcode]).to include("Enter a valid postcode (for example, BN1 1AA)")
  end
end
