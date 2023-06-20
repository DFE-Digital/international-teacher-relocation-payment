# spec/models/urn_spec.rb
require "rails_helper"

RSpec.describe Urn do
  context "When a value is given" do
    subject(:urn) { described_class.new("IRP 123456") }

    it "has a value" do
      expect(urn.value).to be_present
    end

    it "generates a Urn with a prefix of 'IRP'" do
      expect(urn.value).to start_with("IRP")
    end

    it "generates a Urn with a length of 8" do
      expect(urn.value.length).to eq(10)
    end

    it "generates a Urn with a suffix of 6 characters" do
      expect(urn.value[4..].length).to eq(6)
    end

    it "generates a Urn with a suffix of only characters in the CHARSET" do
      charset = %w[A B C D E F H J K L M N P R S T U V 0 1 2 3 4 5 6 7 8 9]

      expect(urn.value[4..].chars).to all(be_in(charset))
    end
  end

  context "When a value is not given" do
    subject(:urn) { described_class.new }

    it "has a value" do
      expect(urn.value).to be_present
    end
  end

  describe ".dump" do
    it "returns the given value" do
      expect(described_class.dump(described_class.new("IRPG2345"))).to eq("IRPG2345")
    end
  end

  describe ".load" do
    it "returns the given value when `value` is not `nil`" do
      expect(described_class.load("IRPG2345")).to eq(described_class.new("IRPG2345"))
    end
  end
end
