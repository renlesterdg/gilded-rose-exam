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


  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      next if item.name == Type::SULFURAS

      if !Type::WHICH_AGES.include?(item.name)
        if item.quality > 0
          item.quality = item.quality - 1
        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == Type::TAFKAL80ETC
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end
      item.sell_in = item.sell_in - 1
      if item.sell_in < 0
        if item.name != Type::AGED_BRIE
          if item.name != Type::TAFKAL80ETC
            if item.quality > 0
              item.quality = item.quality - 1
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
    end
  end
end
