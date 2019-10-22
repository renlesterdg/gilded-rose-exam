class GildedRose

  # Need to define a method if you are adding a new type.
  TYPE = {
    'aged_brie' => "Aged Brie",
    'tafkal80etc' => "Backstage passes to a TAFKAL80ETC concert",
    'sulfuras' => "Sulfuras, Hand of Ragnaros",
    'conjured' => "Conjured"
  }.freeze

  MAX_QUALITY = 50
  MIN_QUALITY = 0

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      next if item.name == TYPE['sulfuras'] # has no sell by date nor decreases in quality

      func = "update_#{TYPE.key(item.name)}"

      if self.respond_to?(func, true)
        send(func, item)
      else
        update_normal(item)
      end
      item.sell_in = item.sell_in - 1
    end
  end

  private

  def update_normal(item)
    if item.sell_in <= 0
      # sell by date has passed, quality degrades twice as fast
      set_quality(item, item.quality - 2)
      return
    end

    set_quality(item, item.quality - 1)
  end

  # Aged Brie actually increases in quality the older it gets
  def update_aged_brie(item)
    set_quality(item, item.quality + 1)
  end

  # increases in quality as its sell_in value approaches;
  # quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less
  # but quality drops to 0 after the concert
  def update_tafkal80etc(item)
    case
    when item.sell_in <= 0
      item.quality = MIN_QUALITY
    when item.sell_in < 6
      set_quality(item, item.quality + 3)
    when item.sell_in < 11
      set_quality(item, item.quality + 2)
    else
      set_quality(item, item.quality + 1)
    end
  end

  # degrade in quality twice as fast as normal items
  def update_conjured(item)
    if item.sell_in <= 0
      set_quality(item, item.quality - 4)
      return
    end

    set_quality(item, item.quality - 2)
  end

  def set_quality(item, value)
    return if value <= MIN_QUALITY
    return if value >= MAX_QUALITY

    item.quality = value
  end
end
