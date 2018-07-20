# frozen_string_literal: true

require 'lucid_sql/repository'

module LucidSQL
  if defined?(::Sequel)
    class SequelRepository < Repository
      #
      # @param sql [String] the raw SQL string
      # @param *args [Array] bind parameters
      # @param **kwargs [Hash] direct interpolation via template string (do not use with untrusted input)
      #
      # @return [Sequel::LiteralString, Sequel::SQL::PlaceholderLiteralString]
      #
      private def format_sql(sql, *args, **kwargs)
        Sequel.lit(sql % kwargs, *args)
      end
    end
  end
end
