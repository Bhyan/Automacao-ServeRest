Before do
    @service = lambda {|klass| klass.new}
end

After do
    Utils.new.delete_all_products
    Utils.new.delete_all_users
end