require 'spec_helper'

describe SearchFieldsController do

  let(:search_fields_controller) { SearchFieldsController.new(resource_class: Organization) }
  let(:user_interface) { UserInterface.new }

  describe "#post_handle_option" do
    context "given valid option" do
      it "selects the next controller" do
        expect(user_interface).to receive(:next).with(kind_of(SearchValueController))
        search_fields_controller.post_handle_option(user_interface, '_id')
      end
    end

    context "given invalid option" do
      it "handles the error" do
        expect(search_fields_controller).to receive(:handle_invalid_option)
        search_fields_controller.post_handle_option(user_interface, "not_a_column_name")
      end
    end
  end

end
