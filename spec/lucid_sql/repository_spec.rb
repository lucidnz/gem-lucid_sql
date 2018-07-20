# frozen_string_literal: true

require 'lucid_sql/repository'

module LucidSQL
  RSpec.describe Repository do
    subject(:sql) { Repository.new(__dir__ + '/../sql/*.sql') }

    it 'returns a String' do
      expect(sql.select_unpublished_products).to be_a(String)
    end

    it 'supports interpolation' do
      %w[collections products].each do |table|
        result = sql.copy_from(table: table)

        expect(result).to match(/^COPY #{table}/)
      end
    end

    it 'does not support bind parameters' do
      expect { sql.copy_from('STDIN', table: 'products') }.to raise_error(ArgumentError)
    end
  end
end
