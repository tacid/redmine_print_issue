class AddAttachmentTemplateToPrintTemplates < ActiveRecord::Migration
  def self.up
    change_table :print_templates do |t|
      t.attachment :template
    end
  end

  def self.down
    remove_attachment :print_templates, :template
  end
end
