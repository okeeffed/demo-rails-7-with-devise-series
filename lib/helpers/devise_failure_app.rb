module Helpers
  class DeviseFailureApp < Devise::FailureApp
    def respond
      if request.env['REQUEST_PATH'].start_with?('/api')
        http_auth
      else
        redirect
      end
    end
  end
end
