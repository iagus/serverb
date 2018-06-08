module Serverb
  class Logger

    class << self
      def print_start_message
        print_info 'Starting server...'
      end

      def print_info message
        "[INFO] [#{Time.now}] #{message}"
      end

    end

  end
end
