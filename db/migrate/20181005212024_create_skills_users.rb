class CreateSkillsUsers < ActiveRecord::Migration[5.2]
  def up
    create_table :skills_users do |t|
      t.integer :skill_id
      t.integer :user_id

      t.timestamps
    end
  end
  def down
  	drop_table :skills_users
  end
end
