class PagesController < ApplicationController
  skip_before_action :require_login, only: %i[terms privacy top]
    def terms
    end

    def privacy
    end

    def top
    end
end
