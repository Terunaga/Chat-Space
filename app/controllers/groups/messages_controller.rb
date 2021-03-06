class Groups::MessagesController < ApplicationController
  include Groups::MessageHelper
  before_action :set_group, only: %i(index create)

  def index
    @groups   = current_user.groups.order_by_desc
    @message  = Message.new
    @messages = @group.messages.includes(:user)
    respond_to do |format|
      format.html
      format.json { render json: @messages.to_json(include: :user) }
    end
  end

  def create
    @message = current_user.messages.build(create_params)
    @message.save
    respond_to do |format|
      format.json
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def create_params
    params.require(:message).permit(:text, :image).merge(group_id: params[:group_id])
  end
end
