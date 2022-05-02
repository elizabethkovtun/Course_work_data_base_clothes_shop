class OrderMailer < ApplicationMailer
default from: 'shop@example.com'

	def complete_order
		@user = params[:user]
    mail(to: @user.email, subject: 'Order complete')
	end
end
