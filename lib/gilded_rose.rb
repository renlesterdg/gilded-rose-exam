class GildedRose
  module Type
    AGED_BRIE = "Aged Brie"
    TAFKAL80ETC = "Backstage passes to a TAFKAL80ETC concert"
    SULFURAS = "Sulfuras, Hand of Ragnaros"
    CONJURED = "Conjured"

    WHICH_AGES = [
      AGED_BRIE,
      TAFKAL80ETC
    ]
  end

  MAX_QUALITY = 50
  MIN_QUALITY = 0

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      next if item.name == Type::SULFURAS

      if !Type::WHICH_AGES.include?(item.name)
        item.quality = get_quality(item.quality - 1)
      else
        item.quality = get_quality(item.quality + 1)
        if item.name == Type::TAFKAL80ETC
          if item.sell_in < 11
            item.quality = get_quality(item.quality + 1)
          end
          if item.sell_in < 6
            item.quality = get_quality(item.quality + 1)
          end
        end
      end
      item.sell_in = item.sell_in - 1
      if item.sell_in < 0
        if item.name != Type::AGED_BRIE
          if item.name != Type::TAFKAL80ETC
            item.quality = get_quality(item.quality - 1)
          else
            item.quality = get_quality(item.quality - item.quality)
          end
        else
          item.quality = get_quality(item.quality + 1)
        end
      end
    end
  end

  private

  def get_quality(value)
    [[value, MAX_QUALITY].min, MIN_QUALITY].max
  end
end
