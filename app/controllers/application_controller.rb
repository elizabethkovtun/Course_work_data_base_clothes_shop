class ApplicationController < ActionController::Base
	skip_before_action :verify_authenticity_token
	helper_method :current_order

	def current_order
		Order.find_or_create_by(user: current_user, status: :in_progress)
	end

end
