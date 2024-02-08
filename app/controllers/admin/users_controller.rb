module Admin
  class UsersController < ApiController
    def show
      user = User::List::FindItem.call(params[:id])

      render status: 200, json: { user: Users::Serializer.as_json(user) }
    end

    def index
      users = User::List::FetchItems.call(user_params)

      render status: 200, json: { users: Users::Serializer.collection_as_json(users) }
    end

    def create
      persisted, user = User::List::AddItem.call(user_params)

      status = persisted ? 200 : 422

      render status: status, json: { user: Users::Serializer.as_json(user) }
    end

    def update
      changed, user = User::List::UpdateItem.call(id: params[:id], params: user_params)

      status = changed ? 200 : 422

      render status: status, json: { user: Users::Serializer.as_json(user) }
    end

    def destroy
      destroyed, user = User::List::DeleteItem.call(params[:id])

      if destroyed
        head :no_content
      else
        render status: 422, json: { user: Users::Serializer.as_json(user) }
      end
    end

    private

    def user_params
      Users::Params.call(params)
    end
  end
end
