require "#{Rails.root}/app/helpers/store_helper"
include StoreHelper
namespace :store do
  desc "Create multiple orders"
  task random_orders: :environment do
  	run_random_orders
  end

end
