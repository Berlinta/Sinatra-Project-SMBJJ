class CreateSmbbjProgressTrackers < ActiveRecord::Migration
  def change
    create_table :smbbj_progress_trackers do |t|
      t.string :content
      t.ineger :user_id
      
      t.timestamps null: false #adds time stamps
    end
  end
end
