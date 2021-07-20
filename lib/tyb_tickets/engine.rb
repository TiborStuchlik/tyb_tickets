module TybTickets
  class Engine < ::Rails::Engine
    isolate_namespace TybTickets

    initializer "static assets" do |app|
      app.middleware.insert_before(::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/html")
    end
  end
end
