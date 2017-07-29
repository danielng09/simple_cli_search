class DetailedResultController < ApplicationController

  attr_accessor :resource_class, :search_value

  def initialize(resource_class, search_value)
    @resource_class = resource_class
    @search_value = search_value
    @search_result = resource_class.find_by(_id: search_value).as_json
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
      @search_result.each do |column_name, column_value|
        row do
          column(column_name, width: 20)
          column(column_value, width: 80)
        end
      end

    end
  end
end
