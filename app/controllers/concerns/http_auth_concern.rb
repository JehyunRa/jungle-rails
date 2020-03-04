# app/controllers/concerns/http_auth_concern.rb
module HttpAuthConcern
    extend ActiveSupport::Concern

    included do
        before_action :http_authenticate
    end

    def http_authenticate
        # return true unless Rails.env == 'production'
        authenticate_or_request_with_http_basic do |username, password|
            username == ENV['USERNAME'] && password == ENV['PASSWORD']
        end
        # shortform: http_basic_authenticate_with name: ENV['ADMIN_KEY'], password: ENV['ADMIN_PW']
    end
end
