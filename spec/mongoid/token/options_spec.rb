require File.join(File.dirname(__FILE__), %w[.. .. spec_helper])

describe Mongoid::Token::Options do
  before do
    @options = Mongoid::Token::Options.new(
      {
        :length => 9999,
        :retry_count => 8888,
        :contains => :nonsense,
        :field_name => :not_a_token
      }
    )
  end

  it "should have a length" do
    @options.length.should == 9999
  end

  it "should default to a length of 4" do
    Mongoid::Token::Options.new.length.should == 4
  end

  it "should have a retry count" do
    @options.retry_count.should == 8888
  end

  it "should default to a retry count of 3" do
    Mongoid::Token::Options.new.retry_count.should == 3
  end

  it "should have a list of characters to contain" do
    @options.contains.should == :nonsense
  end

  it "should default to an alphanumeric set of characters to contain" do
    Mongoid::Token::Options.new.contains.should == :alphanumeric
  end

  it "should have a field name" do
    @options.field_name.should == :not_a_token
  end

  it "should default to a field name of 'token'" do
    Mongoid::Token::Options.new.field_name.should == :token
  end

  it "should create a pattern" do
    Mongoid::Token::Options.new.pattern.should == "%s4"
  end

  describe "override_to_param" do
    it "should be an option" do
      expect(Mongoid::Token::Options.new({:override_to_param => false}).override_to_param?).to eq false
    end

    it "should default to true" do
      expect(Mongoid::Token::Options.new.override_to_param?).to eq true
    end
  end

   describe "skip_finder" do
    it "should be an option" do
      expect(Mongoid::Token::Options.new({:skip_finders => true}).skip_finders?).to eq true
    end

    it "should default to false" do
      expect(Mongoid::Token::Options.new.skip_finders?).to eq false
    end
  end
end
