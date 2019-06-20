class CreateTechniquesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :techniques do |t|
      t.string :content
      t.integer :user_id

      t.timestamps null: false #adds time stamps
    end
  end
end