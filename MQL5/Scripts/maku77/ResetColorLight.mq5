/*
 * Reset the colors of all charts (light theme)
 */
#property copyright "maku77"
#property link "https://maku77.github.io/"
#property version "1.00"
#property strict

#include <Charts\Chart.mqh>

/**
 * Setup the drawing style of the chart.
 *
 * @param chart the chart object to be set up
 */
void setupChart(CChart& chart) {
    // Show-hide settings
    chart.Mode(CHART_CANDLES);
    chart.ShowOHLC(true);
    chart.ShowLineBid(true);
    chart.ShowLineAsk(true);
    chart.ShowGrid(true);
    chart.ShowPeriodSep(true);
    chart.ShowVolumes(CHART_VOLUME_TICK);
    chart.ShowDateScale(true);
    chart.ShowPriceScale(true);
    chart.Scale(3);

    // Color settings
    chart.ColorBackground(clrWhite);
    chart.ColorForeground(clrGray);
    chart.ColorGrid(clrLightGray);
    chart.ColorVolumes(clrGray);
    chart.ColorBarUp(clrBlack);
    chart.ColorBarDown(clrBlack);
    chart.ColorChartLine(clrBlack);
    chart.ColorCandleBull(clrWhite);
    chart.ColorCandleBear(clrBlack);
    chart.ColorLineBid(clrDodgerBlue);
    chart.ColorLineAsk(clrOrangeRed);
}

/*
 * Script program start function
 */
void OnStart() {
    CChart c;
    for (c.FirstChart(); c.ChartId() >= 0; c.NextChart()) {
        setupChart(c);
        c.Redraw();
    }
}
