class AddOmniauthToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string     #제공자 : facebook, tweeter, linked_in
    add_index :users, :provider
    add_column :users, :uid, :string          #페이스북 id 
    add_index :users, :uid
    add_column :users, :name, :string         #페이스북 이름 => omniauth때문에 name이 메일인증 받아서 할때 안 들어거나??
    add_index :users, :name                 
    add_column :users, :image, :string        #페이스북 프사
    add_index :users, :image
  end
end
