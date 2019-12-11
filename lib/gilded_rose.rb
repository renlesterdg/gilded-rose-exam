class GildedRose

  def initialize(items)
    @items = items

    # LIST OF ALL ITEM NAME INVOLVED
    @aged_brie = "Aged Brie"
    @backstage_passes = "Backstage passes to a TAFKAL80ETC concert"
    @sulfuras = "Sulfuras, Hand of Ragnaros"
    @conjured = "Conjured"
  
    # ITEM QUALITY REQUIREMENT
    @max_quality = 50 # QUALITY NEVER MORE THAN 50
    @min_quality = 0 # QUALITY NEVER NEGATIVE
  end

  def update_quality
    @items.each do |item|
      if item.name != @aged_brie && item.name != @backstage_passes
        if item.quality > @min_quality
          if item.name != @sulfuras
            item.quality = item.quality - 1 
          end
        end
      else
        if item.quality < @max_quality
          item.quality = item.quality + 1

          if item.name == @backstage_passes
            if item.sell_in < 11
              if item.quality < @max_quality
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < @max_quality
                item.quality = item.quality + 1
              end
            end
          end
        end
      end

      if item.name != @sulfuras
        item.sell_in = item.sell_in - 1
      end

      if item.sell_in < 0
        if item.name != @aged_brie
          if item.name != @backstage_passes
            if item.quality > @min_quality
              if item.name != @sulfuras
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < @max_quality
            item.quality = item.quality + 1
          end
        end
      end
      
    end
  end

end
