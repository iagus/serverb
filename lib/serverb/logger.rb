require_relative 'parser'

module Serverb

  module Logger

    extend self

    def print_log_request request
      method, path, protocol = Serverb::Parser.parse_request_line(request)
      print_info "Request '#{method}' for #{path}"
    end

    def print_start_message
      print_info 'Starting server...'
    end

    def print_info message
      "[INFO] [#{Time.now}] #{message}"
    end

  end
end
