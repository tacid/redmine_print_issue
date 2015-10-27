Rails.configuration.to_prepare do
  require 'redmine_print_issue/view_hooks'
  require 'redmine_print_issue/plugin_setting_helper'
  require 'redmine_print_issue/patches/issue_patch'
  require 'redmine_print_issue/patches/issues_controller_patch'
end

module RedminePrintIssue
  def self.directory
    Redmine::Plugin.registered_plugins[:redmine_print_issue].directory
  end
end
