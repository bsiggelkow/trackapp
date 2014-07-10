class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.references :task, index: true
      t.timestamp :start
      t.timestamp :stop
    end
  end
end
