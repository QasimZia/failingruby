class ConnectionsController < ApplicationController
    before_action :require_login
    def create 
        c = User.find(params[:id])
        cx = Connection.create(user: current_user, connectee: c, status: "Pending")


        puts cx.errors.full_messages
        redirect_to :back
    end

    def accept
        c = Connection.find(params[:id])
        c.update(status: "Accepted")

        redirect_to :back
    end

    def deny
        c = Connection.find(params[:id])

        c.destroy

        redirect_to :back
    end
end
