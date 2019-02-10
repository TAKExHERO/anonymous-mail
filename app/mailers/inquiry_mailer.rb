class InquiryMailer < ApplicationMailer
  def received_email(user)
    @user = user
    mail to: user.email,
         subject: "【#{@user.name}様について匿名のお知らせがあります】"
  end
end
