class HomeController < ApplicationController
    before_action :authenticate_user!

    def index
        @users = User.all
        @records = Record.select("id,user_id,book_id,due_date").where(user_id: current_user.id)
    end

    def delete
      user = User.find(params[:id])
      user.delete
      redirect_to home_path
    end

    def create
      record = Record.find(params[:id])
      unless record.renewed
        if record.update(due_date: (record.due_date + 15.days))
          record.update(renewed: true)
        end
      end
      redirect_to home_path
    end
end
