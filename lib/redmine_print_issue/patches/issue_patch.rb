unless Issue.included_modules.include?(Serenity::Generator)
  Issue.send(:include, Serenity::Generator)
end

module RedminePrintIssue
  module Patches

    module IssuePatch
      def self.included(base) # :nodoc:
        base.send(:include, InstanceMethods)

        base.class_eval do
          unloadable
        end
      end

      module InstanceMethods
        def odt_path(template_name)
          File.join( Redmine::Plugin.registered_plugins[:redmine_print_issue].directory, 'templates' , template_name )
        end

        def custom_value_for_name(name)
          field_id = CustomField.find_by_name(name).id
          custom_values.detect { |v| v.custom_field_id == field_id }
        end
      end

    end
  end
end

unless Issue.included_modules.include?(RedminePrintIssue::Patches::IssuePatch)
  Issue.send(:include, RedminePrintIssue::Patches::IssuePatch)
end


