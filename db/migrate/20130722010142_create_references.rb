class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.references :post
      t.references :tag
      t.timestamps
    end
  end
end
