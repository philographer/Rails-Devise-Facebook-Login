class CreateReportArticles < ActiveRecord::Migration
  def change
    create_table :report_articles do |t|

        t.string :report_title          #신고글 제목
        t.string :report_content        #신고글 내용
        t.string :report_username       #신고글 작성자
        t.string :report_email          #신고글 이메일
        t.string :report_image          #신고글 스샷

      t.timestamps null: false
    end
  end
end
