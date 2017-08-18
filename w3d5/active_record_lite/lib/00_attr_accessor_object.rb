class AttrAccessorObject
  def self.my_attr_accessor(*names)
    # ...
    names.each do |name|
      instance_name = "@#{name.to_s}".to_sym
      getter_name = "#{name.to_s}=".to_sym

      #define get method
      define_method(name) do
        self.instance_variable_get(instance_name)
      end 

      #define setter method
      define_method(getter_name) do |arg|
        self.instance_variable_set(instance_name, arg)
      end

    end
  end
end
