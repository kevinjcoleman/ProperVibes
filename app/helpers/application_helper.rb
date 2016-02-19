module ApplicationHelper
	def nav_link(link_text, link_path)
  		class_name = current_page?(link_path) ? 'active' : ''
			content_tag(:li, :class => "#{class_name}") do
    		link_to link_text.html_safe, link_path
  		end
	end

	def admin_check(*paths)
  		paths.include?("admin")
	end

	def site? 
		request.original_url.include?('/site/')
	end

	def site_nav_link(link_text, link_path, controller)
		active = nil
		if current_page?(link_path)
			active = 'active'
		elsif request.original_url.include?("/#{controller}")
			active = 'active'
		end
		content_tag(:li, :class => "#{active}") do
    		link_to link_text.html_safe, link_path
  		end
	end

end
