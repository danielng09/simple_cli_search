require 'spec_helper'

describe User do

  describe "associations" do
    subject { User }

    it 'belongs to a organization' do
      relation = subject.reflect_on_association(:organization)
      expect(relation.macro).to eq :belongs_to
    end

    it 'has many submitted tickets' do
      relation = subject.reflect_on_association(:submitted_tickets)
      expect(relation.macro).to eq :has_many
    end

    it 'has many assigned tickets' do
      relation = subject.reflect_on_association(:assigned_tickets)
      expect(relation.macro).to eq :has_many
    end
  end

  describe "constants" do
    it "has a constant PRIMARY_ATTRIBUTES" do
      expect(User::PRIMARY_ATTRIBUTES).to be_kind_of(Array)
    end
  end

end
