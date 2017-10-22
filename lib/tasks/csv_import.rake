require 'csv'
require 'smarter_csv'

namespace :csv_import do
  desc "Import event data"
  task event_data: :environment do
    file = 'konzerthaus.csv'
    csv = SmarterCSV.process(file, { col_sep: ";", headers: true })
    csv.each do |row|
      #I select only the params concerning the event and create an event
      event_params = row.without(:title, :performers, :program)
      event = Event.create(event_params)

      #Here I select the params concerning only the concert related to the event, if format: concert
      if row.slice(:format).values == ["Konzert"]
        concert_params = row.slice(:title)
        concert = event.concerts.create(concert_params)
        
        #now I need to extract the program into musical pieces and composers
        program = row.slice(:program, :performers)
        musical_pieces = program.slice(:program).values
        performers = program.slice(:performers).values

        #With the following line we obtain an array like this:
        #["Antonín Dvořák Terzett für zwei Violinen und Viola C-Dur op. 74", "Bedřich Smetana Klaviertrio g-Moll op. 15"]         
        array_musical_pieces = musical_pieces[0].gsub("\n", ",").split(",")

        #We need now to loop each item in the array_musical_piece and extract the composer from the musical piece
        #We will extract the composer from the first two words of each array, the rest will be the musical piece
        array_musical_pieces.each do |piece|
          #here the words of each item of the array_musical_piece will be separated by commas
          #then array_new will be created out of the first two items of array, these corresponds to name and lastname of composer
          array = piece.split(" ")
          array_new = [array[0], array[1]]
          #here we join the first and second item of the array into the composer array
          composer = array_new.join(" ") 
      
          #the musical_piece is then just the difference between array and array_new joined without commas
          musical_piece = [array - array_new].join(" ")
          
          concert.musical_pieces.create(title:musical_piece, composer:composer)
        end
        
        #This will return an array like this: [["Evgeny", "Vapnyarsky", "Violine"], ["Teresa", "Kammerer", "Violine"]]
        array_performers_and_instruments = performers[0].gsub("\n", ",").split(",")
        #
        new_array_performers_and_instruments = array_performers_and_instruments.map { |item| item.split(" ").join(",").split(",")}

        new_array_performers_and_instruments.each do |item|
          if item.include? "orchester" || "orchester" || "Orchestra" )
          performer = [item[0], item[1]].join(" ")
          instrument = (item - [item[0],item[1]]).join(" ")
          concert.performers.create(name: performer, instrument: instrument)
        end
      elsif row.slice(:format).values == ["Ausstellung"]
        puts "this is just an exhibition"
      end 

     
    end

end
