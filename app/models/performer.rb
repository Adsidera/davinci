class Performer
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :instrument
  
  belongs_to :concert
end
