require 'redmine_print_issue'

Redmine::Plugin.register :redmine_print_issue do
  name 'Redmine Print Issue plugin'
  author 'Tacid'
  description 'This is a plugin for printing issue with ODT template description with template'
  version '2.0.2'
  url 'https://github.com/tacid/redmine_print_issue'
  author_url 'https://github.com/tacid'
  settings default: {
    tracker_ids: [ "" ],
    print_templates: [ "" ]
  }, partial: 'settings/redmine_print_issue_settings'
end
