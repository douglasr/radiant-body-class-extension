module BodyClassTags
  include Radiant::Taggable
  
  desc %{
    Expands if a <pre><r:body_class [inherit="true|false"]/></pre> call would return a body class string.
    The <pre><r:unless_body_class /></pre> tag is also available to be used.
  }
  tag "if_body_class" do |tag|
    tag.expand unless (tag.locals.page.body_class.nil? || tag.locals.page.body_class.name.blank?)
  end
  tag "unless_body_class" do |tag|
    tag.expand if (tag.locals.page.body_class.nil? || tag.locals.page.body_class.name.blank?)
  end
  
  desc "Render the body class text for the current page."
  tag "body_class" do |tag|
    body_class = tag.locals.page.body_class.name
    if body_class.blank?
      parent = tag.locals.page.parent
      while parent && body_class.blank?
        body_class = parent.body_class.name
        parent = parent.parent
      end
    end
    body_class
  end

end