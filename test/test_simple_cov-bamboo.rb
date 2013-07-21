require 'helper'

class TestBambooFormatter < Test::Unit::TestCase
  context "With a (mocked) Coverage.result" do
    setup do
      SimpleCov.filters = []
      SimpleCov.groups = {}
      SimpleCov.formatter = nil
      @original_result = {source_fixture('sample.rb') => [nil, 1, 1, 1, nil, nil, 1, 1, nil, nil],
          source_fixture('app/models/user.rb') => [nil, 1, 1, 1, nil, nil, 1, 0, nil, nil],
          source_fixture('app/controllers/sample_controller.rb') => [nil, 1, 1, 1, nil, nil, 1, 0, nil, nil]}
    end

    context "a simple cov result initialized from that" do
      setup { @result = SimpleCov::Result.new(@original_result) }

      should "have 3 filenames" do
        assert_equal 3, @result.filenames.count
      end

      should "have 3 source files" do
        assert_equal 3, @result.source_files.count
        assert @result.source_files.all? {|s| s.instance_of?(SimpleCov::SourceFile)}, "Not all instances are of SimpleCov::SourceFile type"
      end

      should "return an instance of SimpleCov::FileList for source_files and files" do
        assert_equal SimpleCov::FileList, @result.source_files.class
        assert_equal SimpleCov::FileList, @result.files.class
      end

      should "have files equal to source_files" do
        assert_equal @result.files, @result.source_files
      end

      should "have accurate covered percent" do
        # in our fixture, there are 13 covered line (result in 1) in all 15 relevant line (result in non-nil)
        assert_equal 100.0*13/15, @result.covered_percent
      end

    end



      context "and bamboo formatter being used" do
        setup do
          @result = SimpleCov::Result.new(@original_result)
          SimpleCov.formatter = SimpleCov::Formatter::BambooFormatter
        end

        should "return an array containing formatted string with result.format!" do
          @result.format!
        end
      end
    end

end if SimpleCov.usable?
