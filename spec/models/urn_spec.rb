# spec/models/urn_spec.rb
require "rails_helper"

RSpec.describe Urn do
  subject(:urn) { described_class.new }

  it "has a value" do
    expect(urn.value).to be_present
  end

  it "generates a Urn with a prefix of 'IRP'" do
    expect(urn.value).to start_with("IRP")
  end

  it "generates a Urn with a length of 8" do
    expect(urn.value.length).to eq(9)
  end

  it "generates a Urn with a suffix of 6 characters" do
    expect(urn.value[3..].length).to eq(6)
  end

  it "generates a Urn with a suffix of only characters in the CHARSET" do
    charset = %w[A B C D E F H J K L M N P R S T U V 0 1 2 3 4 5 6 7 8 9]

    expect(urn.value[3..].chars).to all(be_in(charset))
  end

  describe ".dump" do
    it "returns the given value" do
      expect(described_class.dump("IRPG2345")).to eq("IRPG2345")
    end
  end

  describe ".load" do
    it "generates a new Urn when `value` is `nil`" do
      expect(described_class.load(nil)).not_to be_nil
    end

    it "returns the given value when `value` is not `nil`" do
      expect(described_class.load("IRPG2345")).to eq("IRPG2345")
    end
  end
end
