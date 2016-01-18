class CreatePrintTemplates < ActiveRecord::Migration
  def change
    create_table :print_templates do |t|

      t.timestamps null: false
    end
  end
end
