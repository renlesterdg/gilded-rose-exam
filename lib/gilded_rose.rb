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
          item.quality = get_quality(item.quality + 3)
        elsif item.sell_in < 11
          item.quality = get_quality(item.quality + 2)
        else
          item.quality = get_quality(item.quality + 1)
        end
      when Type::AGED_BRIE
        item.quality = get_quality(item.quality + 1)
      else
        if item.sell_in <= 0
          item.quality = get_quality(item.quality - 2)
        else
          item.quality = get_quality(item.quality - 1)
        end
      end

      item.sell_in = item.sell_in - 1
    end
  end

  private

  def get_quality(value)
    [[value, MAX_QUALITY].min, MIN_QUALITY].max
  end
end
