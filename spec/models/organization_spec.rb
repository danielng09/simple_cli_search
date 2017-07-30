require 'spec_helper'

describe Organization do

  describe "associations" do
    subject { Organization }

    it 'has many users' do
      relation = subject.reflect_on_association(:users)
      expect(relation.macro).to eq :has_many
    end

    it 'has many tickets' do
      relation = subject.reflect_on_association(:tickets)
      expect(relation.macro).to eq :has_many
    end
  end

  describe "constants" do
    it "has a constant PRIMARY_ATTRIBUTES" do
      expect(Organization::PRIMARY_ATTRIBUTES).to be_kind_of(Array)
    end
  end

  describe ".valid_search_input" do
    context "given search field in primary attributes" do
      context "given non integer string" do
        it "returns false" do
          expect(Organization.valid_search_input("_id", "33j8")).to be(false)
        end
      end
      context "given integer string" do
        it "returns true" do
          expect(Organization.valid_search_input("_id", "33")).to be(true)
        end
      end
    end
  end
end
