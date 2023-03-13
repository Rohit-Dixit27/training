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
-You can also pass in a layout: 'layout_name' option to the render call inside the format block to specify different layouts for different formats