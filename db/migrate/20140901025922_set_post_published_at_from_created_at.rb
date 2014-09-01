class SetPostPublishedAtFromCreatedAt < ActiveRecord::Migration
  def up
    Post.where(published_at: nil).update_all('published_at = created_at')
  end

  def down
    # Nothing to do; published at should already be set
  end
end
