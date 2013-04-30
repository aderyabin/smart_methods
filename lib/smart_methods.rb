module SmartMethods
  def smart_methods(*names)
    names.each do |name|
      instance_eval %Q{
        def #{name}(v = nil, &block)
          if block_given?
            @#{name} = block
          elsif v
            @#{name} = v
          else
            return @#{name} unless superclass.respond_to?(:#{name}) and value = superclass.#{name}
            @#{name} ||= value.clone
          end
        end

        def #{name}=(v)
          @#{name} = v
        end
      }

      class_eval %Q{
        def #{name}
          return @#{name} if @#{name}
          if self.class.#{name}.is_a?(Proc)
            @#{name} = instance_eval(&self.class.#{name})
          else
            @#{name} = self.class.#{name}
          end
        end

        def #{name}=(v)
          @#{name} = v
        end
      }
    end
  end
end
