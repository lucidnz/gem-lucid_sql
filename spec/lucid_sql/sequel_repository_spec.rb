# frozen_string_literal: true

require 'lucid_sql/sequel_repository'

module LucidSQL
  RSpec.describe SequelRepository do
    subject(:sql) { SequelRepository.new(__dir__ + '/../sql/*.sql') }

    it 'returns a Sequel::LiteralString' do
      expect(sql.select_unpublished_products).to be_a(Sequel::LiteralString)
    end

    it 'supports interpolation' do
      %w[collections products].each do |table|
        result = sql.copy_from(table: table)

        expect(result).to match(/^COPY #{table}/)
      end
    end

    it 'does not support bind parameters' do
      result = sql.copy_from('STDIN', table: 'products')

      expect(result).to have_attributes(args: ['STDIN'])
    end
  end
end
