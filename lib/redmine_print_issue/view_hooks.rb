module RedminePrintIssue
  module RedminePrintIssue
    class Hooks < Redmine::Hook::ViewListener
      render_on :view_issues_show_description_bottom, partial: "print_issue"
    end
  end
end
