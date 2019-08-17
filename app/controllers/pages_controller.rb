class PagesController < ApplicationController
  def home
  end

  def search
    @categories = Category.all.order(name: :asc)
    @category = Category.find(params[:category]) if params[:category].present?

    # @gigs = Gig.where("active = ? AND gigs.title ILIKE ? AND category_id = ?", true, "%#{params[:q]}%", params[:category])

    query_condition = []
    query_condition[0] = "gigs.active = true"

    @q = params[:q]
    @min = params[:min]
    @max = params[:max]
    @delivery = params[:delivery].present? ? params[:delivery] : '0'

    @sort = params[:sort].present? ? params[:sort] : 'price asc'

    unless @q.blank?
      query_condition[0] += ' AND gigs.title ILIKE ?'
      query_condition.push "%#{@q}%"
    end

    unless params[:category].blank?
      query_condition[0] += ' AND category_id = ?'
      query_condition.push params[:category]
    end

    unless params[:min].blank?
      query_condition[0] += ' AND pricings.price >= ?'
      query_condition.push @min
    end

    unless params[:max].blank?
      query_condition[0] += ' AND pricings.price <= ?'
      query_condition.push @max
    end

    if !params[:delivery].blank? && params[:delivery] != "0"
      query_condition[0] += ' AND pricings.delivery_time <= ?'
      query_condition.push @delivery
    end

    @gigs = Gig
              .select('gigs.id, gigs.title, gigs.user_id, pricings.price AS price')
              .joins(:pricings)
              .where(query_condition)
              .order(@sort)
              .page(params[:page])
              .per(6)
  end

end
