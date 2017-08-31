# SnackAttack Rails App!

**Commit** after each bullet point!

## Steps to follow

(If you don't read closely you can't complain)

* `rails new SnackAttack --database=postgresql`
* Add *everything* and commit. (This is only the time you _should_ `add -A`)
* `rails g model Snack`
  * Open up the newest migration in in the `db/migrate` directory.
  * Add a `name` and `string` column
  ```ruby
    def change
      create_table :snacks do |t|
        t.string :name
        t.integer :calories

        t.timestamps # add a `created_at` and `updated_at`
      end
    end
  ```
* `rails db:migrate`
* Create some seeds in `db/seeds.rb`
  ```ruby
  Snack.create!(name: 'Duane Reade Snack Mix', calories: 100)
  Snack.create!(name: 'Duane Reade Rocky Road Ice Cream', calories: 300)

  Snack.create!(name: 'Microwave Pizza', calories: 400)

  Snack.create!(name: 'M&Ms', calories: 300)
  Snack.create!(name: 'Skittles', calories: 300)
  Snack.create!(name: 'Snickers', calories: 300)

  puts "created #{Snack.count} snacks!"
  ```

# Things to know

* We will have class for every table in our database.  Each class inherits from `ActiveRecord::Base`.  To create a new instance we simply do `Snack.new`, for example.  It takes one argument: a hash of column names and values.
  * `snack = Snack.new(name: 'M&Ms', calories: 300)`

* To save the model to the database, we just call `snack.save` to save it to the database. **We don't need to write any SQL!**
  * `save` returns `true` if was successful and `false` otherwise
  * `save!` raises and error if it cannot save

* The `create` method makes a new instance *and* tries to save it.
The source code looks _something_ looks something like
```ruby
class ActiveRecord::Base
  def self.create(cols_and_vals)
    record = new(cols_and_vals)
    record.save
    record
  end
end
```

* `create!` does what you would expect. Raises an error if it cannot save
```ruby
class ActiveRecord::Base
  def self.create(cols_and_vals)
    record = new(cols_and_vals)
    record.save!
    record
  end
end
```
> In reality this method is more complicated but this is how you can picture it
