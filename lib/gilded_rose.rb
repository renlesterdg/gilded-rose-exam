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
    @sulfuras_quality = 80 # SULFURAS IS LEGENDARY ITEM QUALITY NEVER ALTER

    # SELL IN REQUIREMENT
    @sell_in_10days = 10
    @sell_in_5days = 5
    @sell_in_0days = 0

  end

  def update_quality
    @items.each do |item|
      check_item(item)
    end
  end

  private

  def check_item(item)
    @item_name = item.name

    case @item_name
    when @aged_brie # ITEM IS AGED BRIE
      check_aged_brie(item)
    when @backstage_passes # ITEM IS BACKSTAGE PASSES
      check_backstage_passes(item)
    when @sulfuras # ITEM IS SULFURAS
      check_sulfuras(item)
    when @conjured # ITEM IS CONJURED
      check_conjured(item)
    else # DEFAULT ITEM
      check_default_item(item)
    end
  end

  # AGED BRIE CONDITION
  def check_aged_brie(item)
    if item.quality < @max_quality
      item.quality += 1
    end

    decrease_sell_in(item)
  end

  # BACKSTAGE PASSES CONDITION
  def check_backstage_passes(item)
    if item.quality < @max_quality
      item.quality += 1

      if item.sell_in <= @sell_in_10days # QUALITY INCREASE BY TWICE WHEN 10 DAYS LEFT
          item.quality += 1
      end

      if item.sell_in <= @sell_in_5days # QUALITY INCREASE BY TRIPLE WHEN 5 DAYS LEFT
          item.quality += 1
      end

      if item.sell_in <= @sell_in_0days # QUALITY BECOME ZERO CONCERT PASSED
        item.quality = 0
      end
    end

    decrease_sell_in(item)
  end

  # SULFURAS CONDITION
  def check_sulfuras(item) # NO ALTERATION ON SULFURAS
    item.quality
  end

  def check_conjured(item)
    if item.quality > @min_quality
      item.quality -= 2
    end
    
    decrease_sell_in(item)
  end

  # DEFAULT ITEM CONDITION
  def check_default_item(item)
    if item.quality > @min_quality 
      item.quality -= 1
    end

    if item.sell_in < @sell_in_0days # DROP QUALITY TWICE AFTER SELL BY DATE
      item.quality -= 1
    end

    decrease_sell_in(item)

  end

  # SELL_IN DECREASE BY 1 EACH
  def decrease_sell_in(item)
    item.sell_in -= 1
  end

end
