require 'active_support/concern'

module Filters

  def self.included(base)

    base.class_eval do

      def self.filter(opts)
        params = opts[:params]
        limit = 25
        filters = params.except(:controller, :action, :page, :sortOrder, :sortColumn, :format, :limit, :offset, :store_id)
        filters = filters.select{ |k,v| v.present? }

        relation = self
        filters.each do |key, value|
          type = self.columns_hash[key].type
          if type == :string || type == :text
            relation = relation.contains(key, value)
          elsif type == :integer
            relation = relation.equals(key, value)
          elsif type == :datetime || type == :date
            start_date = value[:start_date]
            end_date = value[:end_date]
            if start_date.blank? || end_date.blank?
              #todo: return error message
              next
            end
            start_date = DateTime.strptime(start_date, "%m/%d/%Y")
            end_date = DateTime.strptime(end_date, "%m/%d/%Y")
            relation = relation.date_between(key, start_date, end_date)
          end
        end
        
        if params[:sortOrder].present? && params[:sortColumn].present?
          if params[:controller] == 'visits' && params[:sortColumn] == 'store'
            sortOrder = params[:sortOrder]
            relation = Visit.joins(:store).order("stores.name #{sortOrder}")
            # puts @object.inspect
            # relation = relation.order(Visits.store.name => params[:sortOrder].to_sym)
          else
            relation = relation.order(params[:sortColumn].to_sym => params[:sortOrder].to_sym)
          end
        end

        if params[:offset]
          relation.limit(limit).offset(params[:offset])
        else
          relation.page(params[:page])
        end
      end
    end
  end
end

ActiveRecord::Base.send(:include, Filters)
