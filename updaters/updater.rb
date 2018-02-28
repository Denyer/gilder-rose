class Updater
  def past_sell_by?(item)
    item.sell_in <= 0
  end
end