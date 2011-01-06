module BodyClassTags
  include Radiant::Taggable
  
  desc %{
    Expands if a <pre><r:body_class [inherit="true|false"]/></pre> call would return a body class string.
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
  
  desc "Render the body class text for the current page."
  tag "body_class" do |tag|
    get_body_class(tag)
  end
  
  def get_body_class(tag)
    body_class = tag.locals.page.body_class.name || ''
    
    parent = tag.locals.page.parent
    while parent
      body_class += ' '+parent.body_class.name unless parent.body_class.name.blank?
      parent = parent.parent
    end
    
    body_class
  end

end