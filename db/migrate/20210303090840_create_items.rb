class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :product_name,    presence: true
      t.text    :detail,          presence: true
      t.integer :category_id,     presence: true
      t.integer :status_id,       presence: true
      t.integer :delivery_fee_id, presence: true
      t.integer :prefectures_id,  presence: true
      t.integer :days_id,         presence: true
      t.integer :price,           presence: true
      t.references :user,         foreign_key: true
      t.timestamps
    end
  end
end
