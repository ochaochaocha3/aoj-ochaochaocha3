/* AOJ 0058 Orthogonal */

#include <stdio.h>
#include <math.h>

int
main(void)
{
    double xA, yA, xB, yB, xC, yC, xD, yD;

    while (scanf("%lf%lf%lf%lf%lf%lf%lf%lf",
                 &xA, &yA, &xB, &yB, &xC, &yC, &xD, &yD) != EOF) {
        if (fabs((xB - xA) * (xD - xC) + (yB - yA) * (yD - yC)) < 1e-10)
            puts("YES");
        else
            puts("NO");
    }

    return 0;
}
