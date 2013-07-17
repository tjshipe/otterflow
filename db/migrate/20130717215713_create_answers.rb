class CreateAnswers < ActiveRecord::Migration
  def change
  	create_table :answers do |t|
  		t.text :text, null: false
  		t.boolean :chosen?, default: false

  		t.timestamps
  	end
  end
end
