class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.matching.subject
  #
  def matching follower, account
    @greeting = "Matching creaated with #{follower.nickname}!"

    mail to: account.email
  end
end
