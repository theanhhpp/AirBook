module ApplicationHelper
	def full_title(title)
		base_title = "Airbook"
		if title.empty?
			base_title
		else
			title + " | " + base_title
		end
		
	end

	def hidden_div_if(condition, attributes = {}, &block)
		if condition
			attributes["style"] = "display: none"
		end
		content_tag("div", attributes, &block)
	end
	def logo(current_user)
		if current_user.nil?
			"AIRBOOK"
		else
			current_user.name+ "'s" + " AIRBOOK"
		end
		
	end
end
