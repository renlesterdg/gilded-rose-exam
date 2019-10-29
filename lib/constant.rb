class Constant
  @aged_brie = "Aged Brie"
  @backstage_pass = "Backstage passes to a TAFKAL80ETC concert"
  @sulfuras = "Sulfuras, Hand of Ragnaros"
  @conjured = "Conjured Item"

  @max_quality_value = 50
  @min_quality_value = 0
  @sulfuras_special_quality_value = 80

  @min_sell_in_value = 0

  class << self
    attr_reader :aged_brie, :backstage_pass, :sulfuras, :conjured, :max_quality_value, :min_quality_value, :sulfuras_special_quality_value, :min_sell_in_value
  end
end