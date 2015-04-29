class DashboardController < ApplicationController
  
  before_filter :is_login?

  def new
  end

  def index
    @no_of_sites = Site.count
    @no_of_orgs = Organization.count
    @no_of_urgent_needs = NeededItem.where(priority: 'urgent').count
    @no_of_people_needing_relief = Site.sum(:population)
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
