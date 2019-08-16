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
    unless @q.blank?
      query_condition[0] += ' AND gigs.title ILIKE ?'
      query_condition.push "%#{@q}%"
    end

    unless params[:category].blank?
      query_condition[0] += ' AND category_id = ?'
      query_condition.push params[:category]
    end

    @gigs = Gig.where(query_condition)
  end

end
