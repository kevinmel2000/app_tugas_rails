module ProductSearching
  extend ActiveSupport::Concern

  included do 
    scope :filter_by_title, ->(title) do
      return if title.blank?
      query_opts = [
        "LOWER(products.title) LIKE LOWER(:key)",
        "LOWER 
        (products.catalog_type) LIKE LOWER(:key)"
        ].join(' OR ')
        where(query_opts, {key: "%#{title}%"})
      end

      scope :filter_by_catalog_type, ->(catalog_type) do
        return if catalog_type.blank?
        where(catalog_type: catalog_type)
      end

      scope :filter_by_bike_production_year, ->(bike_production_year) do 
        return if bike_production_year.blank?
        bonds.where("bike_properties.production_year =?", bike_production_year)
      end

      scope :filter_search, ->(params)  do
        return all if params.blank?
        filter_by_title(params[:title])
        .filter_by_catalog_type(params[:catalog_type])
        .filter_by_bike_production_year(params[:bike_production_year])
      end
  end
end