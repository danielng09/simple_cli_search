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
end
