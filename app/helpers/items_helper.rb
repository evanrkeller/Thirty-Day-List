module ItemsHelper

  def distance(item)
    if item.created_at < 30.days.ago
      "added #{Date.today - item.created_at.to_date} days ago"
    else
      "#{(item.created_at.to_date + 30.days - Date.today).to_i} days to go"
    end
  end
end
