class Event
  include Mongoid::Document
  include Mongoid::Timestamps

  field :season , type: String                
  field :project, type: String
  field :origin, type: String
  field :location, type: String
  field :format, type: String
  field :abo_serie, type: String
  field :start_date, type: DateTime
  field :end_date, type: DateTime
  field :concert_id, type: String


  has_many :concerts

end
