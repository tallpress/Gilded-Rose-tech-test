module StandardItemBehaviours
  MIN_QUALITY = 0
  private
  def limit_quality_to_zero
    if @item.quality < MIN_QUALITY
      @item.quality = MIN_QUALITY
    end
  end

  def pass_time
    @item.sell_in -= 1
  end
end
