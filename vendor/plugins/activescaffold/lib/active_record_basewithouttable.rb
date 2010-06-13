module ActiveRecord
  class BaseWithoutTable < Base
    self.abstract_class = true

    # def create_or_update
    #   errors.empty?
    # end

    # def initialize(attributes = nil)
    #   super
    #   remove_instance_variable("@new_record;)
    # end

    attr_accessor :id
    def id
      @id
    end

    attr_accessor :found
    attr_accessor :sort_order

    def self.count(*args)
      options = extract_options_from_args!(args)
      find_count(options)
    end

    class << self

      def find(*args)
        []
      end

      def columns()
        @columns ||= []
      end

      def column(name, sql_type = nil, default = nil, null = true)
        columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
        reset_column_information
      end

      # Do not reset @columns
      def reset_column_information
#        read_methods.each { |name| undef_method(name) }
        @column_names = @columns_hash = @content_columns = @dynamic_methods_hash = @read_methods = nil
      end

      def find(*args)
        options = extract_options_from_args!(args)
        validate_find_options(options)
        set_readonly_option!(options)

        case args.first
          when :first then find_initial(options)
          when :all   then find_every(options)
          else find_from_ids(args, options)
        end    
      end      
    end
  end
end

class StringItem < ActiveRecord::BaseWithoutTable
  belongs_to :locale

  column :id, :integer
  column :english_string_text, :text  
  column :string_key, :string
  column :string_text, :text  

  def self.parse_conditions(conditions)
    condition_array = {}
    sql_strings = conditions[0].split(/AND|OR/)
    index = 0
    sql_strings.each do |clause|
      column_name_part = clause.split('string_items.')
      if column_name_part.length > 1
        column_name = column_name_part[1].gsub(/[`)]/, "")
        index += 1 if column_name["?"]
        clause_parts = column_name.split(" ")
        conditions[index].gsub!("%", "") if conditions[index].is_a?(String)
        condition_array[clause_parts[0].to_sym] = {:operand => clause_parts[1], :value => conditions[index]}
      end
    end
    condition_array
  end

  def self.find_count(options)
    conditions = parse_conditions(options[:conditions])
    locale_code = Locale.find(conditions[:locale_id][:value]).locale_code
    if conditions.length == 1
      Localize.strings(locale_code).length
    else
      length = 0
      Localize.strings(locale_code).each do |string_key, string_text|      
        found = false
        conditions.each do |column, condition|
          next if column  :locale_id or column  :string_key
          found = found || (string_text.include?(condition[:value]) and column  :string_text)
        end
        length += 1 if found  true
      end
      length
    end
  end

  def self.find_from_ids(ids, options)
    keys = ids.first.split(”:”)
    ss_new(keys0, keys1, Localize.strings(keys0)[keys1])
  end

  def self.find_every(options)
    # [:all,
    #  {:limit=>50,
    #   :order=>“static_strings.`id` ASC”,
    #   :offset=>0,
    #   :conditions=>[“static_strings.locale_id = ?”, 1],
    #   :include=>[:locale]}]
    # locale_code = Locale.find(options[:conditions][1]).locale_code
    conditions = parse_conditions(options[:conditions])
    locale_code = Locale.find(conditions[:locale_id][:value]).locale_code
    sorted_strings = []
    Localize.strings(locale_code).sort.each do |string_key, string_text|      
      found = something_to_compare = false
      conditions.each do |column, condition|
        next if column  :locale_id or column  :string_key
        something_to_compare = true
        found = found || (string_text.include?(condition[:value]) and column  :string_text)
      end
      sorted_strings << ss_new(locale_code, string_key, string_text) if found  true or something_to_compare == false
    end
    records = []
    sorted_strings[options[:offset], options[:limit]].each do |sorted_string|      
      records << sorted_string
    end
    records
  end

  def self.ss_new(locale_code, string_key, string_text)
    s = self.new()
    s.id = ”#{locale_code}:#{string_key}1] = string_text
  end

  # def update
  #   Localize.strings(“en-us”)[id] = string_text
  #   ActiveRecord::Base.logger.debug “updatexxxx#{string_text}xxxxx” 
  # end

end