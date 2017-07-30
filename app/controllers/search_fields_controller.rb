class SearchFieldsController < ApplicationController

  attr_accessor :resource_class

  def initialize(resource_class:)
    @resource_class = resource_class
  end

  #
  # @param {UserInterface} user_interface
  # @param {String} option
  #
  def post_handle_option(user_interface, option)
    if resource_class.column_names.include?(option)
      controller = SearchValueController.new(resource_class: resource_class,
                                             search_field: option)
      user_interface.next(controller)

    else
      handle_invalid_option(user_interface)
    end
  end

  private

  def render_body

    header title: "Searching for #{resource_class.name.pluralize.downcase}", align: "center", bold: true
    vertical_spacing 1

    vertical_spacing 1

    # Field Table
    table(border: true) do
      # Header
      row header: true do
        column("Field", width: 20)
      end

      # Body
      resource_class.column_names.each do |column_name|
        row do
          column(column_name, width: 20)
        end
      end

    end
  end

  def render_options
    aligned " * Type the corresponding field name you'd like to search by (i.e. '_id')"
  end
end
