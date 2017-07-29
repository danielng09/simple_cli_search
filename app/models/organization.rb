class Organization < ActiveRecord::Base
  has_many :users
  has_many :tickets

  PRIMARY_ATTRIBUTES = ["_id", "external_id", "name", "details"].freeze
end
