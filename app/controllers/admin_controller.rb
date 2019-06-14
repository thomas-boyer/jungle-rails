class AdminController < ApplicationController

  http_basic_authenticate_with name: ADMIN_USERNAME, password: ADMIN_PASSWORD

end
