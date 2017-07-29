class SearchResultsController < ApplicationController

  attr_accessor :resource_class, :search_field, :search_value

  def initialize(resource_class, search_field, search_value)
    @resource_class = resource_class
    @search_field = search_field
    @search_value = search_value
    @search_results = resource_class.where("#{@search_field} = ?", @search_value).pluck(*resource_class::PRIMARY_ATTRIBUTES)
  end

  def render_body
    header title: "Search results for #{resource_class.name.pluralize.downcase}", align: "center", bold: true
    vertical_spacing 1
    puts "Found #{@search_results.length} result(s)"

    # Search Results Table
    unless @search_results.empty?
      table(border: true) do
        # Header
        row header: true do
          resource_class::PRIMARY_ATTRIBUTES.each do |column_name|
            column(column_name, width: 25)
          end
        end

        # Results
        @search_results.each do |search_result|
          row do
            search_result.each do |value|
              column(value, width: 25)
            end
          end
        end
      end

      puts "Enter any key to restart."
    end
  end

  #
  # @param {UserInterface} user_interface
  # @param {String} option
  #
  def post_handle_option(user_interface, option)
    home_page_controller = HomePageController.new
    user_interface.next(home_page_controller)
  end
end
