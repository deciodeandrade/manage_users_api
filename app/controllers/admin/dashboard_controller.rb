module Admin
  class DashboardController < ApiController
    def total_users_number
      render status: 200, json: 'total_users_number!'
    end
  end
end
