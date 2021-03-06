module Serverb

  module Parser

    extend self

    def parse_request_line req
      method, path, protocol = req.split(' ')
    end

    def get_uri_string path
      uri = path.split('?').first
    end

    def get_params_string path
      params = path.split('?').last
    end

    def params_to_hash params
      params_array = params.split('&')
      params_array = params_array.map{ |param| param.split('=') }.to_h
    end

    def are_params_present? path
      path.include?('?') && path.split('?').count > 0
    end

  end

end
