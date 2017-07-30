require 'spec_helper'

describe SearchValueController do

  let(:search_value_controller) { SearchValueController.new(resource_class: Organization, search_field: "_id") }
  let(:user_interface) { UserInterface.new }

  before do
    allow(STDOUT).to receive(:write).and_return(nil)
    allow(STDIN).to receive_message_chain(:gets, :chomp).and_return('quit')
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
