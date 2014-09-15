class V1::Network::IpController < ApplicationController
  def ipv4
    remote_ip = request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip
    data = { ipv4: remote_ip }
    respond_to do |format|
      format.json { render :json => data }
    end
  end
end
