require 'spec_helper'

describe ApplicationController do

  let(:application_controller) { ApplicationController.new }
  let(:user_interface) { UserInterface.new }

  before do
    allow(STDOUT).to receive(:write).and_return(nil)
    allow(STDIN).to receive_message_chain(:gets, :chomp).and_return('quit')
  end

  describe "#render" do
    it "renders the body" do
      expect(application_controller).to receive(:render_body)
      application_controller.render
    end
    it "renders the options" do
      expect(application_controller).to receive(:render_options_header)
      expect(application_controller).to receive(:render_options)
      expect(application_controller).to receive(:render_default_options)
      application_controller.render
    end
  end

  describe "#handle_option" do
    context "given option" do
      context "'quit'" do
        it "exits the program" do
          expect(application_controller.handle_option(user_interface, 'quit')).to be nil
        end
      end
      context "'restart'" do
        it "selects the home page controller" do
          expect(user_interface).to receive(:next).with(kind_of(HomePageController))
          application_controller.handle_option(user_interface, 'restart')
        end
      end
      context "'other'" do
        it "calls #post_handle_option" do
          expect(application_controller).to receive(:post_handle_option).with(user_interface, kind_of(String))
          application_controller.handle_option(user_interface, "other")
        end
      end
    end
    context "given exception" do
      it "calls #handle_invalid_option" do
        allow(application_controller).to receive(:post_handle_option).and_raise("error")
        expect(application_controller).to receive(:handle_invalid_option)
        application_controller.handle_option(user_interface, "something")
      end
    end
  end

  describe "#handle_invalid_option" do
    it "takes a new input" do
      expect(STDIN).to receive_message_chain(:gets, :chomp)
      application_controller.handle_invalid_option(user_interface)
    end
    context "given new input" do
      it "calls #handle_option" do
        allow(STDIN).to receive_message_chain(:gets, :chomp).and_return("new input")
        expect(application_controller).to receive(:handle_option)
        application_controller.handle_invalid_option(user_interface)
      end
    end
  end

end
