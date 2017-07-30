class DetailedResultController < ApplicationController

  attr_accessor :resource_class, :search_value

  def initialize(resource_class:, search_value:)
    @resource_class = resource_class
    @search_value = search_value
    @search_result = resource_class.find_by(_id: search_value)
  end

  def render_body
    header title: "Showing detailed result for #{resource_class.name.downcase}", align: "center", bold: true
    vertical_spacing 1

    # Detailed Result Table
    vertical_spacing 1
    table(border: true) do

      # Header
      row header: true do
        column("Field", width: 20)
        column("Value", width: 80)
      end

      # Body
      @search_result.as_json.each do |column_name, column_value|
        row do
          column(column_name, width: 20)
          column(column_value, width: 80)
        end
      end

    end
  end

  def render_options
    @resource_class.reflections.keys.each do |relation|
      aligned " * Type '#{relation}' if you'd like to view the corresponding #{relation}"
    end
  end

  #
  # @param {UserInterface} user_interface
  # @param {String} option
  #
  def post_handle_option(user_interface, option)
    if @resource_class.reflections.keys.include?(option)
      relation = @search_result.try(option)
      results = if relation.is_a?(ActiveRecord::Relation)
                  relation
                else
                  relation.class.where(_id: relation._id)
                end
      resource_class = results.first.class

      controller = SearchResultsController.new(resource_class: resource_class,
                                               results: results)
      user_interface.next(controller)

    else
      handle_invalid_option(user_interface)
    end
  end
end
