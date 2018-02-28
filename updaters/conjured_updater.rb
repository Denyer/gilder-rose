require_relative 'updater'

# updates a conjured item
class ConjuredUpdater < Updater
  def update_quality(item)
    quality = past_sell_by?(item) ? -4 : -2
    item.sell_in -= 1
    item.quality = [item.quality - quality, 0].max
  end
end