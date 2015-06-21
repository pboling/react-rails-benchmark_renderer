require "react/server_rendering/concerns/instrumentation"

# Extends SprocketsRenderer for benchmarking in the Rails environment
# - benchmarks rendering in the same manner as Rails view rendering is benchmarked by Rails
module React
  module ServerRendering
    class BenchmarkRenderer < SprocketsRenderer
      include Concerns::Instrumentation
    end
  end
end
