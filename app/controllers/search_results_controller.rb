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
    aligned("Found #{@search_results.length} result(s)", color: "green")

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

    end
  end

  def render_options
    aligned " * Type the corresponding '_id' to view more details"
  end

  #
  # @param {UserInterface} user_interface
  # @param {String} option
  #
  def post_handle_option(user_interface, option)
    if get_search_result_ids.map.include?(option)
      controller = DetailedResultController.new(resource_class, option)
      user_interface.next(controller)

    else
      handle_error(user_interface, option)
    end
  end

  private

  def get_search_result_ids
    @search_results.map { |search_result| search_result.first.to_s }
  end
end
