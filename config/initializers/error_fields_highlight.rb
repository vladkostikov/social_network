ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  is_label = html_tag.index '<label'
  css_class = is_label ? 'text-danger' : 'is-invalid'

  class_position = html_tag.index 'class="'
  # Если есть тег class, то добавляем в его начало нужный класс
  # Если нет тега class, то добавляем его и указываем нужный класс
  if class_position
    html_tag.insert(class_position + 7, "#{css_class} ")
  else
    html_tag.insert(html_tag.index('>'), " class=#{css_class}")
  end
end
