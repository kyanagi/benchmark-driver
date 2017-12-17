require 'benchmark/driver'

Benchmark.driver(runner: :exec) do |x|
  x.prelude = <<-EOS
    class Array
      alias_method :blank?, :empty?
    end
    array = []
  EOS
  x.report 'array.empty?', %{ array.empty? }
  x.report 'array.blank?', %{ array.blank? }
  x.compare!
end
