require_relative 'updater'

# updates a pass item
class PassUpdater < Updater
  def update_quality(item)
    quality = 1
    quality = 2 if item.sell_in <= 10
    quality = 3 if item.sell_in <= 5
    quality = -item.quality if past_sell_by?(item)
    item.sell_in -= 1
    item.quality = [[item.quality + quality, 0].max, 50].min
  end
end