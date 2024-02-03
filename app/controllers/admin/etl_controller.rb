module Admin
  class EtlController < ApiController
    require 'csv'

    def make_etl_users
      response = import(params['file'].path)

      render status: 200, json: response[:status]
    end

    def etl_users_progress
      #count = User.where(file_id: params['file_id']).size

      render status: 200#, json: count
    end

    private

    def import(path)
      errors = []

      successful, failed = 0, 0

      CSV.foreach(path, headers: true) do |row|
        begin
          user_params = row.to_h
          User.create!(user_params)
          successful += 1
        rescue StandardError => e
          failed += 1
          errors.push({user_params: user_params, error: e})
        end
      end

      attempts = successful + failed

      {status: {attempts: attempts, successful: successful, failed: failed}, errors: errors}
    end
  end
end
