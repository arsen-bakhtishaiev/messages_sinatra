class CreateMessages < ActiveRecord::Migration
 def self.up
   create_table :messages do |t|
     t.string :address
     t.text :message
     t.time :creation_time
     t.integer :message_type
     t.integer :access_counter
   end
 end

 def self.down
   drop_table :messages
 end
end
