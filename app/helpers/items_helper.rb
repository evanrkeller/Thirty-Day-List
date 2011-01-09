module ItemsHelper

  def distance(item)
    if item.created_at < 30.days.ago
      "added #{Time.zone.now.to_date - item.created_at.to_date} days ago"
    else
      "#{(item.created_at.to_date + 30.days - Time.zone.now.to_date).to_i} days to go"
    end
  end
end
