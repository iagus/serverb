require 'socket'

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
          conn.puts "Hello world"
          conn.close
        end
      end
    end

  end

end
