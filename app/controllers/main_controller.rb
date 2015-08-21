class MainController < ApplicationController
    before_action :authenticate_user!

    def index
        @bobparties = Bobparty.all
    end

    #학식 파싱하는 부분
    def todays_meal
            uri = URI("http://m.inha.ac.kr/homepage/campus/FoodMenuList.aspx?") #학식메뉴(학생식당) 주소 담는 부분
            html_doc = Nokogiri::HTML(Net::HTTP.get(uri)) #주소를 문서화
            html_doc.css('br').each{ |br| br.replace ", " }

            @school_restaurant = html_doc.css("#leftRuleMenu//h2").inner_text #학생식당
            @school_today_date = html_doc.css("div.tbl_food_list//table//tbody//tr[1]//th[1]").text#오늘날짜
            #아래부분부터 메뉴와 가격
            @school_morning_soban_menu = html_doc.css("div.tbl_food_list//table//tbody//tr[1]//td.left//div").inner_html
            @school_morning_snack_menu = html_doc.css("div.tbl_food_list//table//tbody//tr[2]//td.left//div").inner_html
            @school_lunch_ddukbaegi_menu = html_doc.css("div.tbl_food_list//table//tbody//tr[3]//td.left//div").inner_html
            @school_lunch_myungga_menu = html_doc.css("div.tbl_food_list//table//tbody//tr[4]//td.left//div").inner_html
            @school_lunch_nuddle_menu = html_doc.css("div.tbl_food_list//table//tbody//tr[5]//td.left//div").inner_html
            @school_lunch_soban_menu = html_doc.css("div.tbl_food_list//table//tbody//tr[6]//td.left//div").inner_text
            @school_lunch_dongas_menu = html_doc.css("div.tbl_food_list//table//tbody//tr[7]//td.left//div").inner_text
            @school_lunch_casual_menu = html_doc.css("div.tbl_food_list//table//tbody//tr[8]//td.left//div").inner_text
            @school_lunch_snack1_menu = html_doc.css("div.tbl_food_list//table//tbody//tr[9]//td.left//div").inner_text
            @school_lunch_snack2_menu = html_doc.css("div.tbl_food_list//table//tbody//tr[10]//td.left//div").inner_text
            @school_dinner_ddukbaegi_menu = html_doc.css("div.tbl_food_list//table//tbody//tr[11]//td.left//div").inner_text
            @school_dinner_myungga_menu = html_doc.css("div.tbl_food_list//table//tbody//tr[12]//td.left//div").inner_text
            @school_dinner_soban_menu = html_doc.css("div.tbl_food_list//table//tbody//tr[13]//td.left//div").inner_text

            @school_morning_soban_price = html_doc.css("div.tbl_food_list//table//tbody//tr[1]//td[2]").inner_text
            @school_morning_snack_price = html_doc.css("div.tbl_food_list//table//tbody//tr[2]//td[2]").inner_text
            @school_lunch_ddukbaegi_price = html_doc.css("div.tbl_food_list//table//tbody//tr[3]//td[4]").text
            @school_lunch_myungga_price = html_doc.css("div.tbl_food_list//table//tbody//tr[4]//td[3]").text
            @school_lunch_nuddle_price = html_doc.css("div.tbl_food_list//table//tbody//tr[5]//td[3]").inner_text
            @school_lunch_soban_price = html_doc.css("div.tbl_food_list//table//tbody//tr[6]//td[2]").inner_text
            @school_lunch_dongas_price = html_doc.css("div.tbl_food_list//table//tbody//tr[7]//td[2]").inner_text
            @school_lunch_casual_price = html_doc.css("div.tbl_food_list//table//tbody//tr[8]//td[2]").inner_text
            @school_lunch_snack1_price = html_doc.css("div.tbl_food_list//table//tbody//tr[9]//td[2]").inner_text
            @school_lunch_snack2_price = html_doc.css("div.tbl_food_list//table//tbody//tr[10]//td[2]").inner_text
            @school_dinner_ddukbaegi_price = html_doc.css("div.tbl_food_list//table//tbody//tr[11]//td[2]").inner_text
            @school_dinner_myungga_price = html_doc.css("div.tbl_food_list//table//tbody//tr[12]//td[2]").inner_text
            @school_dinner_soban_price = html_doc.css("div.tbl_food_list//table//tbody//tr[13]//td[2]").inner_text
            #verify
     uri = URI("http://m.inha.ac.kr/homepage/campus/FoodMenuList.aspx?gubun=2") #학식메뉴(학생식당) 주소 담는 부분
            html_doc = Nokogiri::HTML(Net::HTTP.get(uri)) #주소를 문서화
            html_doc.css('br').each{ |br| br.replace ", " }

            @school_restaurant2 = html_doc.css("#leftRuleMenu//h2").inner_text #학생식당
            @school_today_date2 = html_doc.css("div.tbl_food_list//table//tbody//tr[1]//th[1]").text#오늘날짜
            #아래부분부터 메뉴와 가격
            @school_launch_menu = html_doc.css("div.tbl_food_list//table//tbody//tr[1]//td.left//div").inner_text
            @school_dinner_menu = html_doc.css("div.tbl_food_list//table//tbody//tr[2]//td.left//div").text

    end
    def _todays_meal2
        uri = URI("http://m.inha.ac.kr/homepage/campus/FoodMenuList.aspx?gubun=2") #학식메뉴(학생식당) 주소 담는 부분
            html_doc = Nokogiri::HTML(Net::HTTP.get(uri)) #주소를 문서화
            html_doc.css('br').each{ |br| br.replace ", " }

            @school_restaurant2 = html_doc.css("#leftRuleMenu//h2").inner_text #학생식당
            @school_today_date = html_doc.css("div.tbl_food_list//table//tbody//tr[1]//th[1]").text#오늘날짜
            #아래부분부터 메뉴와 가격
            @school_launch_menu = html_doc.css("div.tbl_food_list//table//tbody//tr[1]//td.left//div").text
            @school_dinner_menu = html_doc.css("div.tbl_food_list//table//tbody//tr[2]//td.left//div").text





    end


    def report_write

    end

    def report_write_create
        report = ReportArticle.new
        report.report_title = params[:report_title]
        report.report_username = current_user.name
        report.report_email = current_user.email
        report.report_content = params[:report_content]
        report.report_image = params[:report_image]
        report.save
        redirect_to '/'
    end

    def report_list
        @reports = ReportArticle.all
    end

    def report_read
        @one_report = ReportArticle.find(params[:id])
    end

    def report_delete_execute
        report = ReportArticle.find(params[:id])
        if report.report_username == current_user.email
            flash[:notice] = "Post successfully Deleted"
            report.destroy
            redirect_to '/'
        else
            flash[:notice] = "글을 작성한 유져만 삭제가 가능합니다."
            redirect_to '/'
        end
    end

    def bobparty_write_create
        bobparty = Bobparty.new
        bobparty.bobparty_title = params[:bobparty_title]
        bobparty.bobparty_firstmember_email = current_user.email
        bobparty.bobparty_firstmember_name  = current_user.name
        bobparty.bobparty_comment = params[:bobparty_comment]
        bobparty.bobparty_date = params[:bobparty_date]
        bobparty.bobparty_time = params[:bobparty_time]
        bobparty.bobparty_member_maxnum = params[:bobparty_member_maxnum].to_i
        bobparty.save
        redirect_to '/'
    end

    def bobparty_read
        @one_bobparty =  Bobparty.find(params[:id])
        meet_time = @one_bobparty.bobparty_date + " " + @one_bobparty.bobparty_time + ":00 +0900"

        @now_time = Time.zone.now

        meet_time_splited = meet_time.to_s.split(" ")
        meet_date = meet_time_splited[0]
        meet_time = meet_time_splited[1]
        meet_year = meet_date.split("-")[0]
        meet_month = meet_date.split("-")[1]
        meet_day = meet_date.split("-")[2]
        meet_hour = meet_time.split(":")[0]
        meet_minute = meet_time.split(":")[1]
        meet_second = meet_time.split(":")[2]
        meet_time = Time.new(meet_year, meet_month, meet_day, meet_hour, meet_minute, meet_second, "+09:00")

        #1970년부터 얼마나 많이 지났는지 초로 바꿔줌
        @now_time_to_second = @now_time.to_i #현재시간 초로
        @meet_time_to_second = meet_time.to_i #만나는시간 초로
        @meet_time_before30_to_second = meet_time.to_i - 1800 #만나기 30분전을 초로


        if @now_time_to_second > @meet_time_before30_to_second
            func_check_party_member()
            @right_time = true
        else
            @right_time = false
        end
        #@bobparty = Bobparty.find(params[:id])
    end

    def _bobparty_read_chat
        @bobparty_chattings = BobpartyChatting.all
    end

    def bobparty_comment_create
        bobparty_chat = BobpartyChatting.new
        bobparty_chat.comment = params[:comment]
        bobparty_chat.bobparty_id = params[:bobparty_id]
        bobparty_chat.comment_name = current_user.name
        bobparty_chat.comment_email = current_user.email
        bobparty_chat.save
        redirect_to :back
    end

    def bobparty_delete_execute
        bobparty = Bobparty.find(params[:id])
        if bobparty.bobparty_firstmember_email == current_user.email
            flash[:notice] = "Post successfully Deleted"
            bobparty.destroy
            redirect_to '/'
        else
            flash[:notice] = "글을 작성한 유져만 삭제가 가능합니다."
            redirect_to '/'
        end
    end

    def bobparty_correct_or_participation
        bobparty = Bobparty.find(params[:id])
        if bobparty.bobparty_firstmember_email == current_user.email #수정하러온거
            redirect_to '/main/bobparty_correct?id=' + params[:id]
        else
            redirect_to '/main/bobparty_participation?id=' + params[:id]
        end
    end

    def bobparty_correct
        @bobparty = Bobparty.find(params[:id])
    end

    def bobparty_correct_execute
        bobparty = Bobparty.find(params[:id])
        bobparty.bobparty_title = params[:bobparty_title]
        bobparty.bobparty_firstmember_email = current_user.email
        bobparty.bobparty_firstmember_name  = current_user.name
        bobparty.bobparty_comment = params[:bobparty_comment]
        bobparty.bobparty_date = params[:bobparty_date]
        bobparty.bobparty_time = params[:bobparty_time]
        bobparty.bobparty_member_maxnum = params[:bobparty_member_maxnum].to_i
        bobparty.save
        redirect_to '/'
    end

    def bobparty_participation
        bobparty = Bobparty.find(params[:id])
        @bobparties = Bobparty.all

        if bobparty.bobparty_member_nownum < bobparty.bobparty_member_maxnum
            #이미 멤버인지 검사
            if bobparty.bobparty_secondmember_email == current_user.email
                redirect_to '/', :flash => { :error => "이미 이 파티의 멤버입니다!" }
            elsif bobparty.bobparty_thirdmember_email == current_user.email
                redirect_to '/', :flash => { :error => "이미 이 파티의 멤버입니다!" }
            elsif bobparty.bobparty_forthmember_email  == current_user.email
                redirect_to '/', :flash => { :error => "이미 이 파티의 멤버입니다!" }
            else
                #이미 멤버가 아니라면빈자리에 새로 멤버를 넣어줌
                if bobparty.bobparty_secondmember_email == nil
                    bobparty.bobparty_secondmember_email = current_user.email
                    bobparty.bobparty_secondmember_name = current_user.name
                elsif bobparty.bobparty_thirdmember_email == nil
                    bobparty.bobparty_thirdmember_email = current_user.email
                    bobparty.bobparty_thirdmember_name = current_user.name
                elsif bobparty.bobparty_forthmember_email  == nil
                    bobparty.bobparty_thirdmember_email = current_user.email
                    bobparty.bobparty_thirdmember_name = current_user.name
                end
                bobparty.bobparty_member_nownum = bobparty.bobparty_member_nownum + 1
                bobparty.save
                redirect_to '/', :flash => { :notice => "파티에 참여하였습니다." }
            end
        else
            redirect_to '/' , :flash => { :error => "파티가 꽉찼습니다!" }
        end
    end

    def func_check_party_member()
        #이미 멤버인지 검사
            bobparty = Bobparty.find(params[:id])

            if bobparty.bobparty_secondmember_email == current_user.email

            elsif bobparty.bobparty_thirdmember_email == current_user.email

            elsif bobparty.bobparty_forthmember_email  == current_user.email

            elsif bobparty.bobparty_firstmember_email == current_user.email

            else
               redirect_to '/' , :flash => { :error => "파티원이 아닙니다." }
            end
    end

end
