require 'base64'

module Amnesia
  module Spec
    module Helper
      def auth
        authorize(Amnesia.config[:auth][:username], Amnesia.config[:auth][:password])
      end
    end
  end
end
