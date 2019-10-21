class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      # Case block 1: Using @itemGrade to classify items by name
      @itemGrade = ""
      case item.name
      # Classify Aged Brie as Aged
      when "Aged Brie"
        @itemGrade = "Aged"
      # Classify Backstage Pass as Expirable
      when "Backstage passes to a TAFKAL80ETC concert"
        @itemGrade = "Expirable"
      # Classify Sulfuras as Legendary
      when "Sulfuras, Hand of Ragnaros"
        @itemGrade = "Legendary"
      # Others Classified as common
      else
        @itemGrade = "Common"
      end

      # Case Block 2, Updating sell_in and quality based on @itemGrade
      case @itemGrade
      when "Aged"
        # Logic to Handle Aged Items
      when "Expirable"
        # Logic to Handle Aged Items
      when "Legendary"
        # Logic to Handle Legendary Items
      else
        # Logic To deal With common Items
      end

      # (Existing Codes to be depreciated, Keeping for reference)
      # If item name not aged brie and not Backstage Pass
      if item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert"
        # (and) If Item Quality more than 0
        if item.quality > 0
          # (and) If Item name not Sulfuras
          if item.name != "Sulfuras, Hand of Ragnaros"
            # Decrease item quality by 1
            item.quality = item.quality - 1
          end
        end
        # Else (if Item name aged brie and backstage pass)
      else
        # (and) if Item quality less than 50
        if item.quality < 50
          # Increase Item quality by 1
          item.quality = item.quality + 1
          # if item name is Backstage Pass
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            # (and) if item sell in less than 11
            if item.sell_in < 11
              # (and) if item quality Less then 50
              if item.quality < 50
                # Increase item quality by 1
                item.quality = item.quality + 1
              end
            end
            # if item sell in less then 6
            if item.sell_in < 6
              # if item quality less then 50
              if item.quality < 50
                # increase item quality by 1
                item.quality = item.quality + 1
              end
            end
          end
        end
      end
      # If item name not Sulfuras
      if item.name != "Sulfuras, Hand of Ragnaros"
        # Decrease item sell in by 1
        item.sell_in = item.sell_in - 1
      end
      # if item sell in less than 0
      if item.sell_in < 0
        # (and) if item name not Aged Brie
        if item.name != "Aged Brie"
          # (and) if item name not Backstage Pass
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            # (and) if item quality more than 0
            if item.quality > 0
              # (and) if item not Sulfuras
              if item.name != "Sulfuras, Hand of Ragnaros"
                # Decrease Item quality by 1
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        # else (item name is Aged Brie)
        else
          # (and) if item quality less than 50
          if item.quality < 50
            # Increase item quality by 1
            item.quality = item.quality + 1
          end
        end
      end
    end
  end
end
