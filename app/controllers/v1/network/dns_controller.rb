require 'socket'

class V1::Network::DnsController < ApplicationController
  def lookup
    remote_ip = request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip
    hostname = lookup_hostname remote_ip
    data = { }
    if hostname.nil?
      data = {
        status: 'error',
        hostname: nil
      }
    else
      data = {
        status: 'success',
        hostname: hostname
      }
    end
    respond_to do |format|
      format.json { render :json => data }
    end
  end

  private

  def lookup_hostname(ipv4_address_str)
    addr = ipv4_address_str.split('.').map {|x| x.to_i }.pack('C4')
    return Socket.gethostbyaddr(addr).first
  rescue SocketError
    return nil
  end

end
