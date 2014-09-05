class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_hash

      t.timestamps
    end

    create_table :surveys do |t|
      t.integer :creator_id
      t.string :name

      t.timestamps
    end

    create_table :questions do |t|
      t.integer :survey_id
      t.string :text

      t.timestamps
    end

    create_table :choices do |t|
      t.integer :question_id
      t.string :text

      t.timestamps
    end

    create_table :answers do |t|
      t.integer :question_id
      t.integer :choice_id

      t.timestamps
    end
  end
end
