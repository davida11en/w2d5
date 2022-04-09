require "passenger"
require "byebug"

class Flight
    attr_reader :passengers
    def initialize(flightnum, capacity) #str w num, num
        @flight_number = flightnum
        @capacity = capacity
        @passengers = []
    end

    def full?
        @passengers.length == @capacity
    end

    def board_passenger(newpassenger) 
        # dont add pass to full flights full?
        if !self.full? && newpassenger.has_flight?(@flight_number)
            @passengers << newpassenger
        end
    end

    def list_passengers
        flyers = []
        @passengers.each do |pass|
            flyers << pass.name
        end
        flyers
    end

    def [](num)
        @passengers[num]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end
end