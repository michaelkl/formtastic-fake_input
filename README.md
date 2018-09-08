# Formtastic FakeInput

Fake input class for Formtastic.

It generates `<span>` tags for data values instead of `<input>`s.

This is useful when you need to show read-only value in the resource edit form using all regular input decorations, giving user a clear understanding of its "readonly-ness" and without the ability to pass its value in the form POST request.

It outputs a simple `<label>` with a `<span />` wrapped in the standard `<li>` wrapper.

You can also use the `:value` option to set custom value.

## Usage example
```erb
<%= semantic_form_for(@user) do |f| %>
  <%= f.inputs do %>
    <%= f.input :id, :as => :fake %>
    <%= f.input :tax_class,  :as => :fake, :value => "Class #{f.object.tax_class}" %>
    <%= f.input :first_name, :as => :string %>
  <% end %>
<% end %>
```
```html
<form ...>
  <fieldset>
    <ol>
      <li class="fake">
        <label for="user_id">Id</label>
        <span id="user_id">123</span>
      </li>
      <li class="fake">
        <label for="user_tax_class">Id</label>
        <span id="user_tax_class">Class 5</span>
      </li>
      <li class="string">
        <label for="user_first_name">First name</label>
        <input type="text" id="user_first_name" name="user[first_name]">
      </li>
    </ol>
  </fieldset>
</form>
```

# Copyright
Copyright © 2018 Michael Klimenko. See LICENSE for details.
