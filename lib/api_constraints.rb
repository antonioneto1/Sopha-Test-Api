class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(req)
    @default || req.headers['Accept'].inclede?("application/vnd.sopha_test.v#{@version}")
  end
end

