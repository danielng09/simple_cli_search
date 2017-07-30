require 'spec_helper'

describe SearchResultsController do

  let(:search_value_controller) { SearchResultsController.new(resource_class: Organization, search_field: "_id", search_value: "5") }
  let(:user_interface) { UserInterface.new }

  # before do
  #   allow(STDOUT).to receive(:write).and_return(nil)
  #   allow(STDIN).to receive_message_chain(:gets, :chomp).and_return('quit')
  # end

  describe "#initialize" do
    context "given invalid arguments" do
      it "raises an exception" do
        message = "Must initialize with either the search_field and search_value or with results"
        expect { SearchResultsController.new(resource_class: Organization) }.to raise_error(ArgumentError, message)
        expect { SearchResultsController.new(resource_class: Organization, search_value: "_id") }.to raise_error(ArgumentError, message)
        expect { SearchResultsController.new(resource_class: Organization, search_value: "5") }.to raise_error(ArgumentError, message)
      end
    end

    context "given valid arguments" do
      it "expects #search_results to return an array" do
        expect(search_value_controller.search_results.class). to be([Array, ActiveRecord::Relation])
      end
    end
  end

  describe "#post_handle_option" do
    context "given valid option" do
      it "selects the next controller" do
        expect(user_interface).to receive(:next).with(kind_of(SearchResultsController))
        search_value_controller.post_handle_option(user_interface, '5')
      end
    end

    context "given invalid option" do
      it "calls #handle_invalid_option" do
        expect(search_value_controller).to receive(:handle_invalid_option)
        search_value_controller.post_handle_option(user_interface, "not a matching value")
      end
    end
  end
end
