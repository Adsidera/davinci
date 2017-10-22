class Concert
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title

  has_many :performers
  has_many :musical_pieces
  belongs_to :event
end
