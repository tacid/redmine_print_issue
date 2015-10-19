unless methods.include?(:plugin_setting_multiselect)
  def plugin_setting_multiselect(plugin_name, setting, choices, options={})
    setting_values = Setting.send(plugin_name)[setting]
    setting_values = [] unless setting_values.is_a?(Array)

    content_tag("label", l(options[:label] || "setting_#{setting}")) +
      hidden_field_tag("settings[#{setting}][]", '').html_safe +
      choices.collect do |choice|
        text, value = (choice.is_a?(Array) ? choice : [choice, choice])
        content_tag(
          'label',
          check_box_tag(
             "settings[#{setting}][]",
             value,
             setting_values.include?(value),
             :id => nil
           ) + text.to_s,
          :class => (options[:inline] ? 'inline' : 'block')
         )
      end.join.html_safe
  end
end
