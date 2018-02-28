require_relative 'updater'

# updates a standard item
class StandardUpdater < Updater
  def update_quality(item)
    quality = -1
    quality = -2 if past_sell_by? item
    item.sell_in -= 1
    item.quality = [item.quality + quality, 0].max
  end
end