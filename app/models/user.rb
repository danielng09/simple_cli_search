class User < ActiveRecord::Base
  belongs_to :organization
  has_many :submitted_tickets, class_name: "Ticket", foreign_key: "submitter_id", primary_key: "_id"
  has_many :assigned_tickets, class_name: "Ticket", foreign_key: "assignee_id", primary_key: "_id"

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
