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
        # Conjured Items
      when "Conjured"
        @itemGrade = "Conjured"
        # Others Classified as common
      else
        @itemGrade = "Common"
      end

      # Case Block 2, Updating sell_in and quality based on @itemGrade
      case @itemGrade
        # Logic to Handle Aged Items
      when "Aged"
        # If item quality less than 50
        if item.quality < 50
          # Increase item quality by 1
          item.quality = item.quality + 1
        end
        # Logic to Handle Expirable Items
      when "Expirable"
        # For expirable items ,first manipulate the quality based on sell_in value
        if item.sell_in >= 11
          item.quality = item.quality + 1
        elsif item.sell_in < 11 && item.sell_in >= 6
          item.quality = item.quality + 2
        elsif item.sell_in < 6 && item.sell_in > 0
          item.quality = item.quality + 3
        else
          item.quality = 0
        end

        # Then scale down to quality to a max of 50 if required
        if item.quality > 50
          item.quality = 50
        end

        # Then Decrease sell_in by 1
        item.sell_in = item.sell_in - 1
        # Logic to Handle Legendary Items
      when "Legendary"
        # Unlike conventional items, The legendary item does not degrade in terms of quality or sell_in

        # Logic To deal With Conjured Items
      when "Conjured"
        # First Decrease sell_in by 1
        item.sell_in = item.sell_in - 1
        # If sell_in less than 0
        if item.sell_in < 0
          # (and) If Quality More than or Equal to 2
          if item.quality >= 4
            # Decrease Item quality by 2
            item.quality = item.quality - 4
            # Else (Quality less than 2)
          else
            # Assign Quality to 0
            item.quality = 0
          end
          # Else (sell_in More than 0)
        else
          # (and) If Quality More than or Equal to 1
          if item.quality >= 2
            # Decrease Item quality by 1
            item.quality = item.quality - 2
          else
            # Assign Quality to 0
            item.quality = 0
          end
        end
      else
        # First Decrease sell_in by 1
        item.sell_in = item.sell_in - 1
        # If sell_in less than 0
        if item.sell_in < 0
          # (and) If Quality More than or Equal to 2
          if item.quality >= 2
            # Decrease Item quality by 2
            item.quality = item.quality - 2
            # Else (Quality less than 2)
          else
            # Assign Quality to 0
            item.quality = 0
          end
          # Else (sell_in More than 0)
        else
          # (and) If Quality More than or Equal to 1
          if item.quality >= 1
            # Decrease Item quality by 1
            item.quality = item.quality - 1
          else
            # Assign Quality to 0
            item.quality = 0
          end
        end
      end
    end
  end

end
