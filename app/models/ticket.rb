class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :organization

  PRIMARY_ATTRIBUTES = ["_id", "external_id", "subject", "priority"].freeze

  self.inheritance_column = :_type_disabled

  def self.last
    Ticket.all.order(created_at: :desc).first
  end
end
