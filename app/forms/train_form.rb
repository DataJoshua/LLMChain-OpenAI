class TrainForm
  include ActiveModel::Model

  attr_accessor :doc_url, :doc

  validates_presence_of :doc_url, :doc
end
