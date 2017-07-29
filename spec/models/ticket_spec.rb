require 'spec_helper'

describe Ticket do

  describe "associations" do
    subject { Ticket }

    it 'belongs to a submitter' do
      relation = subject.reflect_on_association(:submitter)
      expect(relation.macro).to eq :belongs_to
    end

    it 'belongs to a assignee' do
      relation = subject.reflect_on_association(:assignee)
      expect(relation.macro).to eq :belongs_to
    end

    it 'belongs to a organization' do
      relation = subject.reflect_on_association(:organization)
      expect(relation.macro).to eq :belongs_to
    end
  end

  describe "constants" do
    it "has a constant PRIMARY_ATTRIBUTES" do
      expect(Ticket::PRIMARY_ATTRIBUTES).to be_kind_of(Array)
    end
  end

end
