module ApplicationHelper
	def sortable(column, title = nil)
	  title ||= column.titleize
	  css_class = column == sort_column ? "current #{sort_direction}" : nil
	  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
	  if params[:category_id].present?
		  link_to title, {:date_from => params[:date_from], :date_end => params[:date_end], :category_id => params[:category_id], :sort => column, :direction => direction}, {:class => css_class}
	  else
		  link_to title, {:sort => column, :direction => direction}, {:class => css_class}

	  end
	end
end
