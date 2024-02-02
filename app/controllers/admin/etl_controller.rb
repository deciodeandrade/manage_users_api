module Admin
  class EtlController < ApiController
    def make_etl_users
      render status: 200, json: 'make_etl_users!'
    end

    def etl_users_progress
      render status: 200, json: 'etl_users_progress!'
    end
  end
end
