class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|

      if item.name == "Sulfuras, Hand of Ragnaros"
        next

      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        
        if item.quality < 50
          if item.sell_in <= 0
            item.quality = 0
          elsif item.sell_in <= 5
            item.quality += 3
          elsif item.sell_in <= 10
            item.quality += 2
          else
            item.quality += 1
          end
        end

      elsif item.name == "Aged Brie"
    
        if item.quality < 50
          item.quality += 1
        end

      elsif item.quality > 0

        if item.sell_in <= 0
          item.quality -= 2
        else
          item.quality -= 1
        end

      end

      item.sell_in -= 1

    end
  end
end
