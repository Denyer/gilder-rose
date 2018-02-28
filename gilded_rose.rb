require_relative 'updater_repository_provider'

# Gilded Rose
class GildedRose

  def initialize(items)
    @items = items
    @updater_repository = UpdaterRepositoryProvider.new.updater_repository
  end

  def update_quality
    @items.each do |item|
      updater = @updater_repository.get_updater item
      updater.update_quality item
    end
  end
end

# item
class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end