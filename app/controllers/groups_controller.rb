class GroupsController < ApplicationController
  before_action :set_users, only: %i(new edit)
  before_action :set_group, only: %i(edit update)

  def index
    @groups = current_user.groups.order_by_desc
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'Group was successfully created.'
    else
      flash[:alert] = 'Group failed to be created.'
      render :new
    end
  end

  def edit; end

  def update
    if @group.update(group_params)
      redirect_to root_path, notice: 'Group was successfully edited.'
    else
      flash[:alert] = 'Group failed to be edited.'
      render :edit
    end
  end

  private

  def set_users
    @users = User.all
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, { user_ids: []})
  end
end
