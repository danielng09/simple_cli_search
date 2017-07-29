class User < ActiveRecord::Base
  belongs_to :organization
  has_many :tickets

  PRIMARY_ATTRIBUTES = ["_id", "external_id", "name", "email"].freeze
end
