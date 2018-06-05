require 'socket'
require_relative 'response'

module Serverb

  class Server

    class << self
      def start port = '3000'
        @server_socket = TCPServer.new port
        puts "[INFO] [#{Time.now}] Starting server..."
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
          response = Serverb::Response.new
          conn.puts response.set_status_line
          conn.close
        end
      end
    end

  end

end
