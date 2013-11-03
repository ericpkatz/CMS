class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :body
      t.integer :priority
      t.boolean :is_home_page

      t.timestamps
    end
  end
end
