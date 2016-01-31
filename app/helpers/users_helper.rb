module UsersHelper
<div class="field">
  <%= f.label "Interests" %><br />
  <%= f.collection_check_boxes :interests_ids, Interests.all, :id, :name do |b| %>
    <div class="collection-check-box">
      <%= b.check_box %>
      <%= b.label %>
    </div>
  <% end %>
</div>

end
