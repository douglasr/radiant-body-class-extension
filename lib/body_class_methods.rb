BodyClassMethods = Proc.new do
  def body_class
     bc = BodyClass.find_by_page_id(self.id)
     bc ||= BodyClass.new
     bc    
   end
  
  def body_class_name
    body_class ? body_class.name : ''
  end

  def body_class_name=(name)
    bc = body_class
    bc.name = name
    self.body_class = bc
  end

  def body_class_inherit
    body_class ? body_class.inherit : false
  end

  def body_class_inherit=(inherit)
    bc = body_class
    bc.inherit = inherit
    self.body_class = bc
  end
end
