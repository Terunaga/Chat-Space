class Groups::MessagesController < ApplicationController
  before_action :set_group, only: %i(index create)

  def index
    @groups   = current_user.groups.order_by_desc
    @message  = Message.new
    @messages = @group.messages
  end

  def create
    message = current_user.messages.build(create_params)
    message.save
    respond_to do |format|
      format.html { }
      format.json { render json: message }
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def create_params
    params.require(:message).permit(:text).merge(group_id: params[:group_id])
  end
end
