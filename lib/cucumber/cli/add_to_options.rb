require 'cucumber/cli/options'

module Cucumber
  module Cli
    class Options
      BUILTIN_FORMATS['calliope_import'] = ['Cucumber::CalliopeImporter::Json', 'Prints the feature as JSON and uploads them to Calliope.pro']
    end
  end
end