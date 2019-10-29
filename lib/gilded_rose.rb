require_relative './constant'

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item = update_ordinary_item(item)
    end
  end

  def change_quality_value(quality_value, to_add_value)
    quality_value = [quality_value + to_add_value, Constant.max_quality_value].min
    quality_value = [quality_value, Constant.min_quality_value].max
    return quality_value
  end
  
  def update_ordinary_item(item)
    item.quality = change_quality_value(item.quality, -1)
    if item.sell_in < Constant.min_sell_in_value
      item.quality = change_quality_value(item.quality, -1)
    end

    item.sell_in = item.sell_in - 1
    return item
  end

  def update_aged_brie(item)
    item.quality = change_quality_value(item.quality, 1)

    item.sell_in = item.sell_in - 1
    return item
  end
end
