class GildedRose
  def initialize(items)
    #assign items to the instance variable
    @items = items
  end

  def update_quality
    @items.each do |item|

      if item.quality > 0 && item.quality < 50 && item.name != "Sulfuras, Hand of Ragnaros"
          if item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert" && item.name != "Conjured"
              if item.sell_in > 0
                item.quality = item.quality - 1
              else
                item.quality = item.quality - 2
              end

          elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
              if item.sell_in >= 11
                  item.quality = item.quality + 1
              elsif item.sell_in > 5 && item.sell_in < 11
                  item.quality = item.quality + 2
              elsif item.sell_in >= 1 && item.sell_in < 6
                  item.quality = item.quality + 3
              elsif item.sell_in <= 0
                  item.quality = item.quality-item.quality
              end

          elsif item.name == "Conjured" 
              if item.sell_in > 0
                  item.quality = item.quality - 2
              else 
                  item.quality = item.quality - 4
              end
          
          elsif item.name == "Aged Brie"
              item.quality = item.quality + 1
          end

          if item.name != "Sulfuras, Hand of Ragnaros"
              item.sell_in = item.sell_in - 1
          end 
      end
    end
  end
end
