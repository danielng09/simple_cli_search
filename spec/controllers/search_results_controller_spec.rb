require 'spec_helper'

describe SearchResultsController do

  let(:results) { Organization.limit(2) }
  let(:search_value_controller) { SearchResultsController.new(resource_class: Organization, search_field: "_id", search_value: "5") }
  let(:search_value_controller_with_results) { SearchResultsController.new(resource_class: Organization, results: results) }
  let(:user_interface) { UserInterface.new }

  before do
    allow(STDOUT).to receive(:write).and_return(nil)
    allow(STDIN).to receive_message_chain(:gets, :chomp).and_return('quit')
  end

  describe "#initialize" do
    context "given invalid combination of arguments" do
      it "raises an exception" do
        message = "Must initialize with either the search_field and search_value or with results"
        expect { SearchResultsController.new(resource_class: Organization) }.to raise_error(ArgumentError, message)
        expect { SearchResultsController.new(resource_class: Organization, search_value: "_id") }.to raise_error(ArgumentError, message)
        expect { SearchResultsController.new(resource_class: Organization, search_value: "5") }.to raise_error(ArgumentError, message)
      end
    end

    context "given results argument that is not an active record relation" do
      it "raises an exception" do
        message = "results must be an active record relation"
        expect { SearchResultsController.new(resource_class: Organization, results: []) }.to raise_error(ArgumentError, message)
      end
    end

    context "given valid arguments" do
      it "expects #search_results to return an array" do
        expect(search_value_controller_with_results.search_results).to be_a_kind_of(Array)
      end
    end
  end

  describe "#post_handle_option" do
    context "given valid option" do
      it "selects the next controller" do
        expect(user_interface).to receive(:next).with(kind_of(DetailedResultController))
        search_value_controller_with_results.post_handle_option(user_interface, '101')
      end
    end

    context "given invalid option" do
      it "calls #handle_invalid_option" do
        expect(search_value_controller_with_results).to receive(:handle_invalid_option)
        search_value_controller_with_results.post_handle_option(user_interface, '129292')
      end
    end
  end
end
