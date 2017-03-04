class Groups::MessagesController < ApplicationController
  def index
    @group  = Group.find(params[:group_id])
    @groups = current_user.groups.order_by_desc
  end
end
