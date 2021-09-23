class Main
{
    public static void main(String[] args)
    {
        Point[] points = new Point[] {
                new Point(0.0,1.0),
                new Point(1.0,0.0),
                new Point(2.0,1.0),
        };

        Circle c = circleFromPoints(points);
        System.out.println(c);
    }

    static class Point
    {
        final double x;
        final double y;

        public Point(double x, double y)
        {
            this.x = x; this.y = y;
        }

        @Override
        public String toString()
        {
            return "("+x+","+y+")";
        }

    }

    static class Circle
    {
        final Point center;
        final double radius;
        public Circle(Point center, double radius)
        {
            this.center = center; this.radius = radius;
        }
        @Override
        public String toString()
        {
            return "Center= " + center + ", r=" + radius;
        }
    }

    public static Circle circleFromPoints(Point[] points)
    {
        final double offset = Math.pow(points[1].x,2) + Math.pow(points[1].y,2);
        final double bc =   ( Math.pow(points[0].x,2) + Math.pow(points[0].y,2) - offset )/2.0;
        final double cd =   (offset - Math.pow(points[2].x, 2) - Math.pow(points[2].y, 2))/2.0;
        final double det =  (points[0].x - points[1].x) * (points[1].y - points[2].y) - (points[1].x - points[2].x)* (points[0].y - points[1].y);

        final double iDet = 1/det;

        final double centerX =  (bc * (points[1].y - points[2].y) - cd * (points[0].y - points[1].y)) * iDet;
        final double centerY =  (cd * (points[0].x - points[1].x) - bc * (points[1].x - points[2].x)) * iDet;
        final double radius =
                Math.sqrt( Math.pow(points[1].x - centerX,2) + Math.pow(points[1].y-centerY,2));

        return new Circle(new Point(centerX,centerY),radius);
    }

}
