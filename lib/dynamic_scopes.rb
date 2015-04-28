require 'active_support/concern'

module DynamicScopes

  def self.included(base)
    base.class_eval do

      def self.starts_with(field, value)
        where("#{field} like ?", "#{value}%")
      end

      def self.contains(field, value)
        where("#{field} like ?", "%#{value}%")
      end

      def self.equals(field, value)
        where("#{field}=?","#{value}")
      end

      def self.date_between(field, start_date, end_date)
        where(field.to_sym => start_date..end_date)
      end

    end
  end
end

ActiveRecord::Base.send(:include, DynamicScopes)