class CreateBobpartyChattings < ActiveRecord::Migration
  def change
    create_table :bobparty_chattings do |t|
        t.string  :comment
        t.string  :comment_name
        t.string  :comment_email
        t.integer :bobparty_id #comment가 종속되어있는 bobparty의 id를 담는다
        #무조건 integer 형의 DB_name_id로 만들어야함
      t.timestamps null: false
    end
  end
end
