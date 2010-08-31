require File.join(File.dirname(__FILE__), 'env')

include Rack::Test::Methods

def app
  Amnesia::Application.new
end

describe "HTTP Auth" do

  it "should require auth" do
    get '/'
    last_response.status.should == 401
  end

  context "when authorized" do
    before do
      auth
    end

    it "should auth successfully" do
      get '/'
      last_response.status.should == 200
    end
  end
end

describe "response to paths" do
  before do
    auth
  end
  
  describe 'successful' do
    it "should respond to root" do
      get '/'
      last_response.status.should == 200
    end
    
    it "should respond to /hosts/new" do
      get "/hosts/new"
      last_response.status.should == 200
    end
    
    it "should respond to /hosts/num" do
      host = Host.gen
      
      get "/hosts/#{host.id}"
      last_response.status.should == 200
    end
  end
  
  describe 'not found' do
    it "should not display host" do
      get "/hosts/-1"
      last_response.status.should == 404
    end
    
    it "should not delete host" do
      delete "/hosts/-1/destroy"
      last_response.status.should == 404
    end
  end
end
