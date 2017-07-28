class ResourceSearchController < ApplicationController

  attr_accessor :resource_class

  def initialize(resource_class)
    @resource_class = resource_class
  end

  def render_body

    header title: "Search for #{resource_class.name.pluralize.downcase}", align: "center", bold: true
    vertical_spacing 1
    puts "Please select one of the fields you'd like to search by in the table below. You can type 'quit' at anytime to exit."

    vertical_spacing 1
    table(border: true) do
      resource_class.column_names.each do |column_name|
        row do
          column(column_name, width: 20)
        end
      end
    end

  end
end
