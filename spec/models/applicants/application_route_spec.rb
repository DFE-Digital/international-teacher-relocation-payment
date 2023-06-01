# frozen_string_literal: true

require "rails_helper"

module Applicants
  describe ApplicationRoute do
    let(:params) { {} }

    subject(:model) { described_class.new(params) }

    describe "validations" do
      it {
        expect(model).to validate_inclusion_of(:application_route)
          .in_array(Applicants::ApplicationRoute::APPLICATION_ROUTE_OPTIONS)
      }
    end

    describe "#eligible?" do
      subject { described_class.new(params).eligible? }

      context "when application_route is teacher" do
        let(:params) { { application_route: "teacher" } }

        it { is_expected.to be_truthy }
      end

      context "when application_route is salaried_trainee" do
        let(:params) { { application_route: "salaried_trainee" } }

        it { is_expected.to be_truthy }
      end

      context "when application_route is other" do
        let(:params) { { application_route: "other" } }

        it { is_expected.to be_falsey }
      end
    end
  end
end
