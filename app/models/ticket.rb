class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :organization

  self.inheritance_column = :_type_disabled

  def self.last
    Ticket.all.order(created_at: :desc).first
  end
end
