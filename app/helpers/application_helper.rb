module ApplicationHelper
  def locale_to
    @locale_to = "#{controller_name.capitalize}##{action_name}"
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    # direction = column == params[:sort] && params[:direction] == "ASC" ? "DESC" : "ASC"
    direction = (column == params[:sort] && params[:direction] == "ASC" ? "DESC" : "ASC")
    (link_to title, :sort => column, :direction => direction)
    # (link_to title, :sort => column)
  end
end
