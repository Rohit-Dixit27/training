--->Mailers
-They inherit from ActionMailer::Base and live in app/mailers. Mailers also work very similarly to controllers.
-Actions, and also, associated views that appear in app/views.
-Instance variables that are accessible in views.
-The ability to utilise layouts and partials.
-The ability to access a params hash.

--template_path
-we can specify template path and template name also.

--Layout
-Just like with controller views, use yield to render the view inside the layout.
-You can also pass in a layout: 'layout_name' option to the render call inside the format block to specify different layouts for different formats.

--Adding attachments
-Action Mailer makes it very easy to add attachments.
-Pass the file name and content and Action Mailer and the Mail gem will automatically guess the mime_type, set the encoding, and create the attachments.

--->Active Storage
--Active Storage facilitates uploading files to a cloud storage service like Amazon S3, Google Cloud Storage,
 or Microsoft Azure Storage and attaching those files to Active Record objects.
 -It comes with a local disk-based service for development and testing and supports mirroring files to subordinate services for backups and migrations.

 --setup
 -rails active_storage:install[create three tables]
 -rails db:migrate

 ---->Attaching files
 -->has_one_attached
 -The has_one_attached macro sets up a one-to-one mapping between records and files. Each record can have one file attached to it.

 -->has_many_attached
 The has_many_attached macro sets up a one-to-many relationship between records and files. Each record can have many files attached to it.


 -----Removing files.

 -user.pictures.purge

 3.0.0 :006 > user.pictures.purge
  ActiveStorage::Attachment Load (0.4ms)  SELECT "active_storage_attachments".* FROM "active_storage_attachments" WHERE "active_storage_attachments"."record_id" = $1 AND "active_storage_attachments"."record_type" = $2 AND "active_storage_attachments"."name" = $3  [["record_id", 132], ["record_type", "User"], ["name", "pictures"]]
  TRANSACTION (0.2ms)  BEGIN                                           
  ActiveStorage::Attachment Destroy (0.3ms)  DELETE FROM "active_storage_attachments" WHERE "active_storage_attachments"."id" = $1  [["id", 5]]
  User Update (0.4ms)  UPDATE "users" SET "updated_at" = $1 WHERE "users"."id" = $2  [["updated_at", "2023-03-14 09:07:35.291668"], ["id", 132]]
  TRANSACTION (1.5ms)  COMMIT                                          
  ActiveStorage::Blob Load (0.2ms)  SELECT "active_storage_blobs".* FROM "active_storage_blobs" WHERE "active_storage_blobs"."id" = $1 LIMIT $2  [["id", 5], ["LIMIT", 1]]
 => [] 