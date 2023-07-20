class TeachForm
  include ActiveModel::Model

  attr_accessor :content

  validates_presence_of :content
end