class CreateImports < ActiveRecord::Migration[7.0]
  def change
    create_table :imports do |t|
      t.string :status, default: 'pending'
      t.integer :successful, default: 0
      t.integer :failed, default: 0

      t.timestamps
    end
  end
end
