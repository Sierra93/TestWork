using TestWork.Abstractions;
using TestWork.Consts;

namespace TestWork.Services;

public class Circle : IFigure
{
    public const double MinRadius = 1e-6;
    private double Radius { get; }
    
    public Circle(double radius)
    {
        if (radius - MinRadius < Constants.CALCULATION_ACCURACY)
            throw new InvalidOperationException($"Неверно указан радиус круга. Радиус был: {radius}");
        Radius = radius;
    }

    public double GetSquare()
    {
        return Math.PI * Math.Pow(Radius, 2d);
    }
}