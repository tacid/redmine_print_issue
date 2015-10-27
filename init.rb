require 'redmine_print_issue'

Redmine::Plugin.register :redmine_print_issue do
  name 'Redmine Print Issue plugin'
  author 'Tacid'
  description 'This is a plugin for printing issue description with template'
  version '1.0.3'
  url 'https://github.com/tacid/redmine_print_issue'
  author_url 'https://github.com/tacid'
  settings default: {
    print_tracker_ids: Tracker.all.map{|t| t.id.to_s},
    print_templates: [ { name: "Default", template: '' } ]
  }, partial: 'settings/redmine_print_issue_settings'
  project_module :issue_tracking do
    permission :render_print_template, issues: [ :render_print_template ],  public: true
  end
end
