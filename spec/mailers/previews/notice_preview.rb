# Preview all emails at http://localhost:3000/rails/mailers/notice
class NoticePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notice/matching
  def matching
    NoticeMailer.matching
  end

end
