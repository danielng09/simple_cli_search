require 'spec_helper'

describe HomePageController do

  let(:home_page_controller) { HomePageController.new }
  let(:user_interface) { UserInterface.new }

  before do
    allow(STDOUT).to receive(:write).and_return(nil)
    allow(STDIN).to receive_message_chain(:gets, :chomp).and_return('quit')
  end

  describe "constants" do
    it "has a constant OPTION_TO_RESOURCE" do
      constant = HomePageController::OPTION_TO_RESOURCE
      expect(constant).to be_kind_of(Hash)
      expect(constant.length).to be 3
    end
  end

  describe "#post_handle_option" do
    context "given valid option" do
      it "selects the next controller" do
        expect(user_interface).to receive(:next).with(kind_of(SearchFieldsController))
        home_page_controller.post_handle_option(user_interface, '1')
      end
    end

    context "given invalid option" do
      it "calls #handle_invalid_option" do
        expect(home_page_controller).to receive(:handle_invalid_option)
        home_page_controller.post_handle_option(user_interface, '4')
      end
    end
  end

end
