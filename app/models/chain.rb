class Chain < ApplicationRecord
  belongs_to :user
  has_one_attached :doc

  has_many :messages, dependent: :destroy

  validates_presence_of :index_name, :description
  

  validates :index_name, format: { with: /\A(?:\w+_)+\w+\z/ }
end
