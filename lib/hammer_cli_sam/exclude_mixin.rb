module HammerCLISAM

  module ExcludeOptions

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods

      # when #exclude_options is called on a command class,
      # we take those options and generate a #recognised_options
      # method overriding the parent's #recognised_options to
      # pull out the options we don't want.
      #
      # it probably seems odd that we're calling #instance_eval here
      # if this is to be modifying a class. Since we're in the
      # ClassMethods module while will be applied to the class,
      # in the current scope, self *is* the class, so our current
      # instance *is* the class definition.
      def exclude_options(*options)
        instance_eval <<-eoruby
          def recognised_options
            super.reject! do |opt|
              #{options.map { |opt| /#{opt.to_s}/ }.inspect}.reduce(false) do |reduced, regex|
                reduced || (opt.attribute_name =~ regex)
              end
            end
          end
        eoruby
      end

    end

  end

end
