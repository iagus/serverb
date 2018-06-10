require_relative 'parser'

module Serverb

  module Logger

    extend self

    def print_log_request request
      method, path, protocol = Serverb::Parser.parse_request_line(request)
      msg = "Request #{method} for #{path}"
      if (Serverb::Parser.are_params_present?(path))
        msg = include_params_in_msg(msg, Serverb::Parser.get_params_string(path))
      end
      print_info msg
    end

    def print_start_message
      print_info 'Starting server...'
    end

    def print_info message
      "[INFO] [#{Time.now}] #{message}"
    end

    def include_params_in_msg message, params
      params = Serverb::Parser.params_to_hash(params).to_s
      message << " with Params: #{params}"
    end

  end
end
