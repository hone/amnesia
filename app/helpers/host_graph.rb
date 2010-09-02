module Amnesia
  module Helpers
    module HostGraph
      def graph_url(data = [], labels = [])
        data.collect! {|d| d.to_f } # hack because dalli returns a string
        GChart.pie(:data => data, :size => '115x115').to_url
      end
    end
  end
end
