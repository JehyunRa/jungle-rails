class Admin::DashboardController < ApplicationController

  include HttpAuthConcern

  def product_count
    @product_count ||= Product.sum("quantity")
  end
  helper_method :product_count

  def category_count
    @category_count ||= Category.count
  end
  helper_method :category_count

end
