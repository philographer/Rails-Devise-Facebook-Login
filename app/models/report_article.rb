class ReportArticle < ActiveRecord::Base
    mount_uploader :report_image, ImageUploaderUploader
end
