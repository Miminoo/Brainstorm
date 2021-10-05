module TaskHelper

  def tag_cloud(tags, classes)
    max = tags.sort_by(&:count).last
    tags.each do |tag|
      index = tag.count.to_f / max.count * (classes.size-1)
      yield(tag, classes[index.round])
    end
  end

  def avg_rating(task_id)
    @rating = Rating.where(task_id: task_id)
    @sum = 0
    @rating.each do |t|
      @sum += t.star
    end
    if @rating.size != 0
      @avg = @sum / @rating.size
      return @avg.round
    else return 0
    end
  end
end