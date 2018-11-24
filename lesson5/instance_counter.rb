module InstanceCounter

  module ClassMethods
    def instances
      @@instances
    end  
  end  

  protected  

  module InstanceMethods
    def register_instances
      self.class.instances +=1
    end  
  end  
end