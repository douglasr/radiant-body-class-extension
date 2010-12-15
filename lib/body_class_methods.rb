BodyClassMethods = Proc.new do
  def body_class
    bc = BodyClass.find_by_page_id(self.id)
    bc ||= BodyClass.new
    bc    
  end
  
  def body_class_name
    bc = body_class
    bc.name
  end

  def body_class_name=(name)
    bc = body_class
    self.save if (self.new_record?)   # we need an ID
    bc.page_id = self.id  # set this specifically each time in case of copy/move/etc
    bc.name = name
    bc.save
  end

  def body_class_inherit
    bc = body_class
    bc.inherit
  end

  def body_class_inherit=(inherit)
    bc = body_class
    self.save if (self.new_record?)   # we need an ID
    bc.page_id = self.id  # set this specifically each time in case of copy/move/etc
    bc.inherit = inherit
    bc.save
  end
end
