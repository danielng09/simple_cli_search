class Ticket < ActiveRecord::Base
  belongs_to :submitter, class_name: "User", foreign_key: "submitter_id", primary_key: "_id"
  belongs_to :assignee, class_name: "User", foreign_key: "assignee_id", primary_key: "_id"

  belongs_to :organization

  PRIMARY_ATTRIBUTES = ["_id", "external_id", "subject", "priority"].freeze

  self.inheritance_column = :_type_disabled

  def self.last
    Ticket.all.order(created_at: :desc).first
  end

  #
  # @param {id} String
  #
  def self.valid_search_input(search_field, id)
    if search_field == PRIMARY_ATTRIBUTES.first
      !is_an_integer?(id)
    else
      true
    end
  end
end
