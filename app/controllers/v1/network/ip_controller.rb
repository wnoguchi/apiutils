class V1::Network::IpController < ApplicationController
  def ipv4
    remote_ip = request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip
    data = {
      status: 'success',
      ipv4: remote_ip
    }
    render :json => data
  end
end
