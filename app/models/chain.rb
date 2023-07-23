class Chain < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy

  validates_presence_of :index_name
end
