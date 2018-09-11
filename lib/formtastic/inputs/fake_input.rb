module Formtastic
  module Inputs
    # Outputs a simple `<label>` with a `<span />` wrapped in the standard
    # `<li>` wrapper. This is useful when you need to show read-only value in the form
    # using all regular input decorations, but without the ability to pass its value
    # in the form POST request.
    # Use the `:value` option to set custom value.
    #
    # @example Full form context and output
    #
    #   <%= semantic_form_for(@user) do |f| %>
    #     <%= f.inputs do %>
    #       <%= f.input :id, :as => :fake %>
    #       <%= f.input :tax_class,  :as => :fake, :value => "Class #{f.object.tax_class}" %>
    #       <%= f.input :first_name, :as => :string %>
    #     <% end %>
    #   <% end %>
    #
    #   <form...>
    #     <fieldset>
    #       <ol>
    #         <li class="fake">
    #           <label for="user_id">Id</label>
    #           <span id="user_id">123</span>
    #         </li>
    #         <li class="fake">
    #           <label for="user_tax_class">Id</label>
    #           <span id="user_tax_class">Class 5</span>
    #         </li>
    #         <li class="string">
    #           <label for="user_first_name">First name</label>
    #           <input type="text" id="user_first_name" name="user[first_name]">
    #         </li>
    #       </ol>
    #     </fieldset>
    #   </form>
    #
    # @see Formtastic::Helpers::InputsHelper#input InputsHelper#input for full documentation of all possible options.
    class FakeInput
      include Base
      include Base::Stringish

      def to_html
        input_wrapping do
          label_html << content_html
        end
      end

      private

      def content_html
        builder.template
               .content_tag(:span, input_options, input_html_options) { content }
      end

      def input_options
        super.except(:value)
      end

      def content
        options[:value] || object.public_send(method).to_s
      end
    end
  end
end
