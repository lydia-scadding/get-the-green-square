class PagesController < ApplicationController
  def home
    @push_count = current_user.work_done
  end
end
