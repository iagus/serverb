module Serverb

  class Response

    def initialize status_code, reason_phrase
      @status_code = status_code
      @reason_phrase = reason_phrase
    end

    def set_status_line
      "HTTP/1.1 #{@status_code} #{@reason_phrase}\r\n"
    end

    def set_content_type_header
      "Content-type: text/html\r\n"
    end

    def set_response_body
      "\r\n<h1>Hello world!</h1>"
    end

    def set_response_headers
      res = ""
      res << set_status_line
      res << set_content_type_header
      res << set_response_body
    end

  end
end
