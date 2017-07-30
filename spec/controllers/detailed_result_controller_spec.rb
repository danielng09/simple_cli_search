require 'spec_helper'

describe DetailedResultController do

  let(:detailed_result_controller) { DetailedResultController.new(resource_class: Organization, search_value: "101") }
  let(:user_interface) { UserInterface.new }

  before do
    allow(STDOUT).to receive(:write).and_return(nil)
    allow(STDIN).to receive_message_chain(:gets, :chomp).and_return('quit')
  end

  describe "#post_handle_option" do
    context "given valid option" do
      it "selects the next controller" do
        expect(user_interface).to receive(:next).with(kind_of(SearchResultsController))
        detailed_result_controller.post_handle_option(user_interface, 'users')
      end
    end

    context "given invalid option" do
      it "calls #handle_invalid_option" do
        expect(detailed_result_controller).to receive(:handle_invalid_option)
        detailed_result_controller.post_handle_option(user_interface, 'invalid relatio')
      end
    end
  end
end
