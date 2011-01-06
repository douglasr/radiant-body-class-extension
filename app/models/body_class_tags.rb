module BodyClassTags
  include Radiant::Taggable
  
  desc %{
    Expands if a <pre><r:body_class [inherit="true|false|all"]/></pre> call would return a body class string.
    The <pre><r:unless_body_class /></pre> tag is also available to be used.
  }
  tag "if_body_class" do |tag|
    body_class = get_body_class(tag)
    if tag.attr['equal']
      tag.expand if tag.attr['equal'] == body_class
    else
      tag.expand unless body_class.blank?
    end
  end

  tag "unless_body_class" do |tag|
    body_class = get_body_class(tag)
    if tag.attr['equal']
      tag.expand unless tag.attr['equal'] == body_class
    else
      tag.expand if body_class.blank?
    end
  end
  
  desc %{
    Render the body class text for the current page. If the current page doesn't have anything in its
    body_class attribute, it will retrieve the value from any parents if the inherit attribute is set
    to 'true' or 'all' as such: <pre><r:body_class [inherit="true|false|all"]/></pre>
  }
  tag "body_class" do |tag|
    get_body_class(tag)
  end
  
  def get_body_class(tag)
    body_class = tag.locals.page.body_class.name || ''

    if (tag.attr['inherit'] == 'true' || tag.attr['inherit'] == 'all')
      parent = tag.locals.page.parent
      while parent
        body_class += " #{parent.body_class.name}" unless parent.body_class.name.blank?
        if tag.attr['inherit'] == 'all'
          parent = parent.parent 
        else
          parent = nil
        end
      end
    end
    
    body_class
  end

end