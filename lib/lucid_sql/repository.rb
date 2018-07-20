# frozen_string_literal: true

module LucidSQL
  class Repository
    #
    # @param glob [String, #to_s] glob pattern for .sql file paths
    #
    # @example
    #   LucidSQL::Repository.new(Hanami.root.join('sql', '*.sql'))
    #
    def initialize(glob)
      Dir.glob(glob.to_s).each do |f|
        m = File.basename(f, '.sql')
        s = File.read(f).strip.gsub(/\s+/, ' ')

        define_reader(m, s)
      end
    end

    #
    # @param method_name [String]
    # @param sql [String]
    #
    private def define_reader(method_name, sql)
      define_singleton_method(method_name) do |*args, **kwargs|
        format_sql(sql, *args, **kwargs)
      end
    end

    #
    # @param sql [String] the raw SQL string
    # @param **kwargs [Hash] direct interpolation via template string (do not use with untrusted input)
    #
    # @return [String]
    #
    private def format_sql(sql, **kwargs)
      sql % kwargs
    end
  end
end
