module BodyClassTags
  include Radiant::Taggable
  
  desc %{
    Expands if a <pre><r:body_class [inherit="true|false"]/></pre> call would return a body class string.
    The <pre><r:unless_body_class /></pre> tag is also available to be used.
  }
  tag "if_body_class" do |tag|
    tag.expand unless (tag.locals.page.body_class.nil? || tag.locals.page.body_class.class_name.blank?)
  end
  tag "unless_body_class" do |tag|
    tag.expand if (tag.locals.page.body_class.nil? || tag.locals.page.body_class.class_name.blank?)
  end
  
  desc "Render the body class text for the current page."
  tag "body_class" do |tag|
    tag.locals.page.body_class.name
  end

end
