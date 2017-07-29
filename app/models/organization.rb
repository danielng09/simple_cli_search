class Organization < ActiveRecord::Base
  has_many :users
  has_many :tickets

  PRIMARY_ATTRIBUTES = ["_id", "external_id", "name", "details"].freeze

  #
  # @param {id} String
  #
  def self.valid_search_input(search_field, input)
    if search_field == PRIMARY_ATTRIBUTES.first
      is_an_integer?(input)
    else
      true
    end
  end
end
