module Connection
  class HTTP < Base

  private

    def force_connection(server)
      uri = parse_server(server)
      @transport = Thrift::HTTPClientTransport.new(server)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == "https"
      http.get(uri.path)
    end
  
    def parse_server(server)
      uri = URI.parse(server)
      raise ArgumentError, 'Servers must start with http' unless uri.scheme =~ /^http/
      uri
    end
  end
end