lucid_sql
=========

Installation
------------

Add the gem to your ‘Gemfile’:

    gem 'lucid_sql'


Usage
-----

### Without Sequel gem

    sql = LucidSQL::Repository.new('sql/*.sql')

    sql.select_unpublished_products # sql/select_unpublished_products.sql

Interpolate trusted data for query reuse (see `String#%`).

    sql.copy_from_stdin(table: 'products')

Does not support bind parameters.

### With Sequel gem

    sql = LucidSQL::SequelRepository.new('sql/*.sql')

Splat arguments are bind parameters (see `Sequel.lit`).

    sql.copy_from('/path/to/copy_data/products', table: 'products')
