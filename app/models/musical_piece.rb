class MusicalPiece 
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :composer

  belongs_to :concert
end

