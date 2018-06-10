require 'socket'
require_relative 'response'
require_relative 'logger'

module Serverb

  module Server

    extend self

    def start port = '3000'
      @server_socket = TCPServer.new port
      puts Serverb::Logger.print_start_message
      run
    end

    def run
      loop {
        @conn = @server_socket.accept
        start_thread
      }
    end

    def start_thread
      Thread.start(@conn) do |conn|
        request = @conn.gets
        print_request_data(request)

        response = Serverb::Response.new 200, 'OK'
        conn.puts response.set_response_headers
        
        conn.close
      end
    end

    def print_request_data request
      puts Serverb::Logger.print_log_request(request)
    end

  end

end
