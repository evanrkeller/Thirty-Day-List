module ApplicationHelper

  def generate_primary_navigation
    content_tag(:ul, nav_entries(primary_nav_fields, nav_map[current_primary_tab] || current_primary_tab))
  end

  protected

  def nav_entries(entries, match_tab)
    ''.html_safe.tap do |items|
      entries.sort_by {|f| f[:order]}.each do |field|
        html_options = field[:title] == match_tab.to_s ? {:class => 'current'} : {}
        html_options[:title] = field[:title]
        item_content = field[:path].blank? ? field[:title] : link_to(field[:title], field[:path], html_options)
        items << content_tag(:li, item_content)
      end
    end
  end

  def primary_nav_fields
    [].tap do |fields|
      fields << {:title => 'Home', :path => root_path, :order => 1}
      fields << {:title => 'About', :path => about_path, :order => 2}
      if current_user.present?
        fields << {:title => 'Sign Out', :path => destroy_user_session_path, :order => 3}
      else
        fields << {:title => 'Sign Up', :path => new_user_registration_path, :order => 3}
        fields << {:title => 'Sign In', :path => new_user_session_path, :order => 4}
      end
    end
  end

  def nav_map
    {
      'registrations' => 'Sign Up',
      'sessions' => 'Sign In'
    }
  end
end
