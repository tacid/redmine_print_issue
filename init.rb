require 'redmine_print_issue/view_hooks'
require 'redmine_print_issue/plugin_setting_helper'

Redmine::Plugin.register :redmine_print_issue do
  name 'Redmine Print Issue plugin'
  author 'Tacid'
  description 'This is a plugin for printing issue'
  version '0.0.1'
  url 'http://github.com/tacid/redmine_print_issue'
  author_url 'https://github.com/tacid'
  settings default: {empty: true}, partial: 'settings/redmine_print_issue_settings'
  project_module :print_issue do
    permission :print_issue_description, public: true
  end
end
