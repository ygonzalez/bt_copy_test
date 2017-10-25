class PassthroughController < ApplicationController
  before_filter :authenticate_user!
  def index
    path = case current_user.roles
      when [:admin]
        "/trades"
      when [:all]
        "/trades"
      when [:smw]
        "/plans"
      else
        "/plans"
        # If you want to raise an exception or have a default root for users without roles
    end

    redirect_to path     
  end
end
