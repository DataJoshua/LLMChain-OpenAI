class Message < ApplicationRecord
  extend Enumerize

  belongs_to :chain

  MESSAGE_ROLES = ["user", "agent"].freeze

  enumerize :role, in: MESSAGE_ROLES, scope: :shallow, predicates: true
  validates_presence_of :text, :role
end
