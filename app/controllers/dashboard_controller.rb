class DashboardController < ApplicationController
  
  before_filter :is_login?

  def new
  end

  def index
#@no_of_companies = Company.count
#@no_of_stores = Store.count
#@no_of_visits = Visit.count
#@no_of_inactive_users = User.count
#

#    @top_five_companies = Company.top5
#    @most_visited_stores = Store.top5
#    @no_of_warranties_expiring = AppliancePart.count_expiring_soon
#
  	# @no_of_visits = 
  end
end
