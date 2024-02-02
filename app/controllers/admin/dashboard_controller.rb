module Admin
  class DashboardController < ApiController
    def total_users_number
      total = User.all.size
      total = User.where(role: params[:by_role]).size if params[:by_role].present?

      render status: 200, json: total
    end
  end
end
