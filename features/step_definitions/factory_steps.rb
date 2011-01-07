module FactoryMethods
  def create_from_table(model_name, table, extra = {})
    factory_name = model_name.gsub(/\W+/, '_').underscore.singularize.to_sym
    is_singular = model_name.to_s.singularize == model_name.to_s
    hashes = if is_singular
               [table.rows_hash]
             else
               table.hashes
             end
    klass = Factory.factories[factory_name].class_name.to_s.classify.constantize
    @they = hashes.map do |hash|
      hash = hash.merge(extra).inject({}) do |h,(k,v)|
        k = k.gsub(/\W+/,'_')
        v = v.split(/\s*,\s*/) if klass.serialized_attributes[k] == Array
        h.update(k.to_sym => v)
      end
      object = Factory.build(factory_name, hash)
      yield object if block_given?
      object.save!
      object
    end
    if is_singular
      @it = @they.last
      instance_variable_set("@#{factory_name}", @it)
    end
  end
end

World(FactoryMethods)

Given %r{^the following (.+):$} do |model_name, table|
  create_from_table(model_name, table)
end

Given %r{^that (.+) has the following (.+):$} do |parent, child, table|
  child = child.gsub(/\W+/,'_')
  parent = parent.gsub(/\W+/,'_').downcase.sub(/^_/, '')
  parent_instance = instance_variable_get("@#{parent}")
  parent_class = parent_instance.class
  if assoc = parent_class.reflect_on_association(child.to_sym) || parent_class.reflect_on_association(child.pluralize.to_sym)
    parent = (assoc.options[:as] || parent).to_s
    begin
      plural = child.singularize != child
      child = assoc.class_name.underscore
      child = child.pluralize if plural
    rescue NoMethodError
    end
  end
  if child.classify.constantize.method_defined?(parent.pluralize)
    create_from_table(child, table, parent.pluralize => [parent_instance])
  elsif child.classify.constantize.method_defined?(parent)
    create_from_table(child, table, parent => parent_instance)
  else
    create_from_table(child, table)
    if assoc.macro == :has_many
      parent_instance.send("#{assoc.name}=", @they)
    else
      parent_instance.send("#{assoc.name}=", @they.first)
    end
  end
end

Given %r{^that product does not have a lightbox-specific representative image$} do
  @product.update_attributes(:lightbox_representative_image => nil)
end

Given %r{^that file resource has the file "sample.zip" as an asset$} do
  @file_resource.update_attributes(:asset => Rack::Test::UploadedFile.new(File.join(Rails.root.to_s, "spec", "data", "sample.zip"), 'application/zip'))
end

Transform /^table:.*spec type/ do |table|
  table.tap do |t|
    t.map_headers!('spec type' => 'type id')
    t.map_column!('type id') { |id| Specification::TYPES.invert[id] }
  end
end

Transform /^table:.*product name/ do |table|
  table.tap do |t|
    t.map_headers!('product name' => 'product id')
    t.map_column!('product id') { |name| Product.find_by_name!(name).id }
  end
end
