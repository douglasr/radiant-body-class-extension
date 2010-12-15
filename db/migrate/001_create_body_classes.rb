class CreateBodyClasses < ActiveRecord::Migration
  def self.up    
    create_table :body_classes do |t|
      t.column :page_id, :integer, :null => false
      t.column :name, :string, :limit => 250, :null => true
      t.column :inherit, :boolean, :null => false, :default => false
    end
    add_index :body_classes, :page_id, :unique => true
  end

  def self.down
    drop_table :body_classes
  end
end