class Chain < ApplicationRecord
  belongs_to :user

  validates_presence_of :index_name
end
