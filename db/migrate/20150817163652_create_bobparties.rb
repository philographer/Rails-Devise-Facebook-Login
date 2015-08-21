class CreateBobparties < ActiveRecord::Migration
  def change
    create_table :bobparties do |t|
        t.string  :bobparty_title,                   null: false                 #밥파티 이름
        t.string  :bobparty_comment,                 null: false                 #밥파티 내용
        t.integer :bobparty_menu                                                 #밥파티 메뉴
        t.integer :bobparty_member_nownum,           null: false, default: 1     #밥파티 현재인원
        t.integer :bobparty_member_maxnum,            null: false                #밥파티 최대인원
        t.string  :bobparty_firstmember_name                                     #밥파티 첫번째 멤버 (방장,이메일)
        t.string  :bobparty_secondmember_name                                    #밥파티 두번째 멤버
        t.string  :bobparty_thirdmember_name                                     #밥파티 세번째 멤버
        t.string  :bobparty_forthmember_name                                     #밥파티 네번째 멤버
        t.string  :bobparty_firstmember_email                                    #밥파티 첫번째 멤버 (방장,이메일)
        t.string  :bobparty_secondmember_email                                   #밥파티 두번째 멤버
        t.string  :bobparty_thirdmember_email                                    #밥파티 세번째 멤버
        t.string  :bobparty_forthmember_email                                    #밥파티 네번째 멤버
        t.string  :bobparty_date                                                 #밥파티 언제 만날지(날짜))
        t.string  :bobparty_time                                                #밥파티 언제 만날지(시간)
        #15분전 시간 있어야하지 않나 ;;
      t.timestamps null: false
    end
  end
end
