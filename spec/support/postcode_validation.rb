RSpec.shared_examples "a valid UK postcode" do |klass, attribute_name = :postcode|
  it "accepts valid postcodes" do
    model = klass.new(attribute_name => "SW1A 1AA")
    model.valid?

    expect(model.errors[attribute_name]).to be_empty
  end

  it "rejects invalid postcodes" do
    model = klass.new(attribute_name => "Invalid postcode")
    model.valid?

    expect(model.errors[attribute_name]).to include("Enter a valid postcode (for example, BN1 1AA)")
  end
end
