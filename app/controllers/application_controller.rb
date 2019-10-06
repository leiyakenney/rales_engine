class ApplicationController < ActionController::API

  def randomized(model)
    model.limit(1).order("RANDOM()")
  end
end
