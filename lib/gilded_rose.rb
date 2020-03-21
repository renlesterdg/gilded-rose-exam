class GildedRose

  def initialize(items)
    @items = items
  end
  require_relative 'functions'

  def update_quality
    @items.each do |item|
      case item.name
      when Aged_Brie
        update_Aged_Brie(item)
      when Backstage_Pass
        update_Backstage_Passes(item)
      when Sulfuras
        # do nothing, legendary items cannot be changed
      when Conjured
        update_Conjured_Item(item)
      else
        update_Normal_Item(item)
      end
    end 
  end
end
