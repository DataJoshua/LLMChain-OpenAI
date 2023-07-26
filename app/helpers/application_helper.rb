module ApplicationHelper
  def short_description(description)
    return description unless description.length > 30

    description.slice(0, 30) + "..."
  end
end
