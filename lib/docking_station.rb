class DockingStation

  attr_reader :bike

  def release_bike
    fail 'no bikes available' unless @bike
    @bike
  end

  def dock(bike)  
    fail 'station is full' unless @bike == nil
    @bike = bike
  end

end
