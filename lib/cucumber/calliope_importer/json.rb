require 'cucumber/formatter/json'

module Cucumber
  module CalliopeImporter
    class Json < Formatter::Json
      def initialize(config)
        super
        if ENV['API_KEY'].nil? || ENV['PROFILE_ID'].nil?
          print "\033[31m" # Sets console colors to red
          print  "Error: API Key and/or Profile ID were not set. Please provide them in your cucumber call or profile like this API_KEY='API Key Here' PROFILE_ID='Profile ID Here'"
          print "\033[0m" # Resets console colors
          exit
        end
      end

      def on_finished_testing(event)
        results = MultiJson.dump(@feature_hashes, pretty: true)
        @io.write(results)
        upload_to_api(results)
      end

      def upload_to_api(results)
        # Set data for api_call
        metadata = JSON.parse(File.read('./storage/metadata.json'))
        calliope_config = {
            'api_key' => ENV['API_KEY'],
            'profile_id' => ENV['PROFILE_ID'],
            'browser' => metadata['browser']['name'],
            'os' => metadata['browser']['platform']
        }
        # Set url
        if ENV['API_URL']
          calliope_config['url'] = ENV['API_URL']
        else
          calliope_config['url'] = 'https://app.calliope/pro'
        end
        api_call(results, calliope_config)
      end

      def api_call(results, calliope_config)
        # Make API call
        url = "#{calliope_config['url']}/api/v2/profile/#{calliope_config['profile_id']}/testresult?browser=#{calliope_config['browser']}&os=#{calliope_config['os']}"
        url = URI.parse(url)
        http = Net::HTTP.new(url.host, url.port)
        # Enable ssl when necessary
        if calliope_config['url'].include? 'https://'
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        end
        header = {
            'content-type' => 'application/json',
            'x-api-key' => calliope_config['api_key']
        }
        request = Net::HTTP::Post.new(url, header)
        request.body = results
        response = http.request(request)
        print "\nAPI response: #{response.body} \n"
      end
    end
  end
end