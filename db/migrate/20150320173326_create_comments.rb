class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.column :name, :string
      t.column :content, :text
      t.column :when, :datetime

      t.timestamps
    end
  end
end
