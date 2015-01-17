module ProductSearching
	extend ActiveSupport::Concern

	included do 
		scope :filter_by_title, ->(title) do
      return if title.blank?
      query_opts = [
        "LOWER(products.title) LIKE LOWER(:key)",
        "LOWER(products.catalog_type) LIKE LOWER(:key)"
      ].join(' OR ')
      where(query_opts, {key: "%#{title}%"})
    end

    scope :filter_search, ->(params)  do
      return all if params.blank?
      filter_by_title(params[:title])
    end

	end
end