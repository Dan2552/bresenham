module Bresenham
  module Line
    class << self
      def iterate_line(x0, y0, x1, y1, &blk)
        # Switch arguments if more steep than wide
        if more_steep_than_wide?(x0, y0, x1, y1)
          switched_blk = Proc.new do |y, x|
            blk.call(x, y)
          end

          return iterate_line(y0, x0, y1, x1, &switched_blk)
        end

        # Switch arguments if right to left
        return iterate_line(x1, y1, x0, y0, &blk) if x0 > x1

        line(x0, y0, x1, y1, &blk)
      end

      private

      def more_steep_than_wide?(x0, y0, x1, y1)
        delta_x = x1 - x0
        delta_y = y1 - y0

        delta_y.abs > delta_x.abs
      end

      def line(x0, y0, x1, y1, &blk)
        delta_x = (x1 - x0).abs
        delta_y = (y1 - y0).abs
        error = delta_x * 0.5
        y_step = y0 < y1 ? 1 : -1

        y = y0

        (x0..x1).each do |x|
          blk.call(x, y)

          error = error - delta_y

          if error < 0
            y = y + y_step
            error = error + delta_x
          end
        end
      end
    end
  end
end
