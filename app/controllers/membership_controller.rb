class MembershipController < ApplicationController
  
  def new
    @membership = Membership.new
  end
  
  def create
  end
  
end