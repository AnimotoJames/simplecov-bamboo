require 'erb'
require 'cgi'
require 'fileutils'
require 'digest/sha1'
require 'time'
require 'nokogiri'

# Ensure we are using a compatible version of SimpleCov
if Gem::Version.new(SimpleCov::VERSION) < Gem::Version.new("0.7.1")
  raise RuntimeError, "The version of SimpleCov you are using is too old. Please update with `gem install simplecov` or `bundle update simplecov`"
end


class SimpleCov::Formatter::BambooFormatter
  
  def format(result)

    # First, generate HTML report
    BambooHTMLFormatter.new.format(result)

    # Second, generate the Clover summary report
    generateCloverReport(result)

  end

  private

    class BambooHTMLFormatter < SimpleCov::Formatter::HTMLFormatter
    
      def output_path
        super + "/site/clover"
      end

    end

    def generateCloverReport(result)

      builder = Nokogiri::XML::Builder.new do
        coverage(generated: Time.now.to_i, clover: "3.1.12") {
          project(timestamp: Time.now.to_i) {
            metrics(elements: result.total_lines, coveredelements: result.covered_lines, ncloc: result.total_lines)
          }
        }
      end

      File.open(File.join(output_path, "clover.xml"), "w+") do |file|
        file.puts builder.to_xml
      end

    end


    def output_path
      SimpleCov.coverage_path
    end

end


$LOAD_PATH.unshift(File.join(File.dirname(__FILE__)))
require 'simplecov-bamboo/version'
