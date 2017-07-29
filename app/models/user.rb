class User < ActiveRecord::Base
  belongs_to :organization
  has_many :tickets

  PRIMARY_ATTRIBUTES = ["_id", "external_id", "name", "email"].freeze

  #
  # @param {id} String
  #
  def self.valid_search_input(search_field, id)
    if search_field == PRIMARY_ATTRIBUTES.first
      is_an_integer?(id)
    else
      true
    end
  end
end
