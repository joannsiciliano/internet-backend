class ApplicationController < ActionController::API
    before_action  :authorized
  
  def authorized
    render json: {error:"please log in"} unless logged_in
  end


  def logged_in
    !!current_user
  end

  def current_user
    auth_header=request.headers["Authorization"]
    if auth_header
      @token=auth_header.split(" ")[1]
      begin
        @user_id=JWT.decode(@token, ENV["SECRET_KEY_BASE"])[0]["user_id"]
  
      rescue JWT::DecodeError
        nil
      end
  end
  if (@user_id)
    @user=User.find(@user_id)
  else
    nil
end
end
end
