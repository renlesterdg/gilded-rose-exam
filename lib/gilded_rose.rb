class GildedRose
  def initialize(items)
    @items = items
  end

  def increase_quality(item)
    item.quality += 1
  end

  def update_conjured(item)
    item.quality += 2
  end

  def update_backstage_passes(item)
    if item.sell_in <= 0
      item.quality = 0
    elsif item.sell_in <= 5 && item.sell_in > 0
      item.quality += 3
    elsif item.sell_in <= 10 && item.sell_in > 5
      item.quality += 2
    else
      increase_quality(item)
    end
  end

  def update_quality
    @items.each do |item|
      if item.quality >= 0 && item.quality <= 50 && item.name != "Sulfuras, Hand of Ragnaros"
        if item.name == "Aged Brie"
          increase_quality(item)
        elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
          update_backstage_passes(item)
        elsif item.name == "Conjured"
          update_conjured(item)
        else
          item.quality -= 1
        end
        item.sell_in -= 1
      end
    end
  end



  # def update_quality
  #   @items.each do |item|
  #     if item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert"
  #       if item.quality > 0
  #         if item.name != "Sulfuras, Hand of Ragnaros"
  #           item.quality = item.quality - 1
  #         end
  #       end
  #     else
  #       if item.quality < 50
  #         item.quality = item.quality + 1
  #         if item.name == "Backstage passes to a TAFKAL80ETC concert"
  #           if item.sell_in < 11
  #             if item.quality < 50
  #               item.quality = item.quality + 1
  #             end
  #           end
  #           if item.sell_in < 6
  #             if item.quality < 50
  #               item.quality = item.quality + 1
  #             end
  #           end
  #         end
  #       end
  #     end
  #     if item.name != "Sulfuras, Hand of Ragnaros"
  #       item.sell_in = item.sell_in - 1
  #     end
  #     if item.sell_in < 0
  #       if item.name != "Aged Brie"
  #         if item.name != "Backstage passes to a TAFKAL80ETC concert"
  #           if item.quality > 0
  #             if item.name != "Sulfuras, Hand of Ragnaros"
  #               item.quality = item.quality - 1
  #             end
  #           end
  #         else
  #           item.quality = item.quality - item.quality
  #         end
  #       else
  #         if item.quality < 50
  #           item.quality = item.quality + 1
  #         end
  #       end
  #     end
  #   end
  # end
end
