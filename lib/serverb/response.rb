module Serverb

  module Response

    extend self

    def set_status_line
      "HTTP/1.1 200 OK\r\n"
    end

  end
end
