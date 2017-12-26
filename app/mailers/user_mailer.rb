class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activate.subject
  #
  def activate(user)
    @url = "#{Settings.site_url}confirm/#{user.activation_token}"
    mail subject: '【Twilioユーザーグループ】登録を完了してください', to: user.mail
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activated.subject
  #
  def activated(user)
    mail subject: '【Twilioユーザーグループ】登録ありがとうございました！', to: user.mail
  end

  def reset_password(r, mail)
    @url = "#{Settings.site_url}reset_password/edit/#{r.token}"
    mail subject: '【Twilioユーザーグループ】パスワード再設定について', to: mail
  end

	def notice_answer(answer)
		question_user = answer.question.user
		@url = "#{Settings.site_url}questions/#{answer.question.id}"
    mail subject: '【Twilioユーザーグループ】回答がありました', to: question_user.mail
	end
end
