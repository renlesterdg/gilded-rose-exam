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

      case item.name
      when Type::TAFKAL80ETC
        if item.sell_in <= 0
          item.quality = MIN_QUALITY
        elsif item.sell_in < 6
          set_quality(item, item.quality + 3)
        elsif item.sell_in < 11
          set_quality(item, item.quality + 2)
        else
          set_quality(item, item.quality + 1)
        end
      when Type::AGED_BRIE
        set_quality(item, item.quality + 1)
      when Type::CONJURED
        if item.sell_in <= 0
          set_quality(item, item.quality - 4)
        else
          set_quality(item, item.quality - 2)
        end
      else
        if item.sell_in <= 0
          set_quality(item, item.quality - 2)
        else
          set_quality(item, item.quality - 1)
        end
      end

      item.sell_in = item.sell_in - 1
    end
  end

  private

  def set_quality(item, value)
    return if value <= MIN_QUALITY
    return if value >= MAX_QUALITY

    item.quality = value
  end
end
