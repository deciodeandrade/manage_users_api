module Admin
  class EtlController < ApiController
    def create_import
      import = User::Import.create!(file: params[:file])

      render status: 200, json: import
    end

    def create_users_from_import
      import = User::Import.find(params[:id])
      response = import.load_data_on_database!

      render status: 200, json: response[:details]
    end

    def create_import_and_users_from_import
      import = User::Import.create(file: params[:file])
      response = import.load_data_on_database!

      render status: 200, json: response[:details]
    end

    def import_progress
      import = User::Import.find(params[:id])

      render status: 200, json: import.details
    end
  end
end
