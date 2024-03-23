class ApiController < ActionController::API
    #before_action :authorization_request

    def pagination_dict(collection)
        {
            current_page: collection.current_page,
            next_page: collection.next_page,
            prev_page: collection.prev_page,
            total_pages: collection.total_pages,
            total_count: collection.total_count
        }
    end

    private

    def authorization_request
        auth = Authorization.new(request)
        @current_user = auth.current_user
        render json: { error: 'Not Authorized' }, status: 401 unless @current_user
    end
end
