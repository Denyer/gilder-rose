require_relative 'updater'

# updates a maturing item
class MaturingUpdater < Updater
  def update_quality(item)
    quality = past_sell_by?(item) ? 2 : 1
    item.sell_in -= 1
    item.quality = [item.quality + quality, 50].min
  end
end