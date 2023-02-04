class ApplicationController < ActionController::API
    def bad_request(resource)
        render status: :bad_request, json: { errors: resource.errors.full_messages }
    end

    def not_found_resource
        render status: 404, json: { errors: 'Resource not found' }
    end
end
