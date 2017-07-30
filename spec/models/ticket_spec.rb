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

  describe ".valid_search_input" do
    context "given search field in primary attributes" do
      context "given non integer string" do
        it "returns true" do
          expect(Ticket.valid_search_input("_id", "33j8")).to be(true)
        end
      end
      context "given integer string" do
        it "returns false" do
          expect(Ticket.valid_search_input("_id", "33")).to be(false)
        end
      end
    end
  end
end
