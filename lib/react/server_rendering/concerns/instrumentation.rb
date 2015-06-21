module React
  module ServerRendering
    module Concerns
      module Instrumentation
        extend ActiveSupport::Concern

        included do
          attr_reader :view_runtime
          prepend RenderWithBenchmark
        end

        module RenderWithBenchmark
          # Ripped mostly from actionpack/lib/action_controller/metal/instrumentation.rb
          def render(*args)
            render_output = nil
            self.view_runtime = cleanup_view_runtime do
              Benchmark.ms { render_output = super }
            end
            ::Rails.logger.info("#{self.class}#render(#{args.join(", ")} in %.1fms" % view_runtime.to_f)
            render_output
          end

          # Ripped directly from actionpack/lib/action_controller/metal/instrumentation.rb
          # A hook which allows you to clean up any time taken into account in
          # views wrongly, like database querying time.
          #
          #   def cleanup_view_runtime
          #     super - time_taken_in_something_expensive
          #   end
          #
          # :api: plugin
          def cleanup_view_runtime #:nodoc:
            yield
          end
        end
      end
    end
  end
end
