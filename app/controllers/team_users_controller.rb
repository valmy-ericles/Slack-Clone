class TeamUsersController < ApplicationController
  def create
    @team_user = TeamUser.new(team_user_params)
    authorize! :create, @team_user

    respond_to do |format|
      return format.json { head :ok } if @team.save

      format.save { render json: @team_user.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    authorize! :destroy, @team_user
    @team_user.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def set_team_user
    @team_user = TeamUser.fin_by(team_id: params[:team_id], user_id: params[:user_id])
  end

  def team_user_params
    params.require(:team_user).permit(:team_id, :user_id)
  end
end
