require_dependency 'application_controller'

class BodyClassExtension < Radiant::Extension
  version "1.0"
  description "Radiant extension to add an attribute to the Page model for body class."
  url "http://www.edgeoftheearth.com/radiant/body-class-extension"

  def activate
    Page.send :include, BodyClassTags
    Page.send :has_one, :body_class
    BodyClass
    Page.module_eval &BodyClassMethods
    admin.page.edit.add :extended_metadata, 'body_class_field'
  end

  def deactivate
  end
end
