class ApplicationController < ActionController::Base
    def self.chkIsActive(val)
        if val === "true"
          return "Yes"
        elsif val === "false"
          return "No"
        else 
          return "N/A"
        end    
      end
end
