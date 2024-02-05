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
      user = User::List::AddItem.call(user_params)

      render status: 200, json: { user: Users::Serializer.as_json(user), message: 'User was created with sucess.' }
    end

    def update
      user = User::List::UpdateItem.call(id: params[:id], params: user_params)

      render status: 200, json: { user: Users::Serializer.as_json(user), message: 'User was updated with sucess.' }
    end

    def destroy
      user = User::List::DeleteItem.call(params[:id])
      
      render status: 200, json: { message: 'User was deleted with sucess.' }
    end

    private

    def user_params
      Users::Params.call(params)
    end
  end
end
