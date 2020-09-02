<?php


namespace App\Laravue;


use Carbon\Carbon;
use Carbon\CarbonPeriod;
use Illuminate\Support\Facades\DB;

class LineChart {

    /**
     * LineChart constructor.
     */
    public function __construct() {

    }

    private function setTimezoneToStartEndDates($dateRange) {
        return collect($dateRange)->map(function ($date) {
            $date = Carbon::createFromFormat('Y-m-d\TH:i:s.uO', $date);
            $date->setTimezone('Europe/Rome');
            return $date;
        });
    }

    private function setDataAggregationLevel($aggregationLevel) {
        //
    }
    public function getChartData($dateRange, $aggregationLevel) {

        $start_date = $this->setTimezoneToStartEndDates($dateRange)[0];
        $end_date = $this->setTimezoneToStartEndDates($dateRange)[1];

        dump($aggregationLevel);

        switch ($aggregationLevel) {
            case "Daily":
                echo "Your favorite color is red!";
                break;
            case "Weekly":
                echo "Your favorite color is blue!";
                break;
            case "Monthly":
                echo "Your favorite color is green!";
                break;
            default:
                echo "Your favorite color is neither red, blue, nor green!";
        }

        $period = CarbonPeriod::create($start_date, '1 month', $end_date);
        $chart_data = [];
        foreach ($period as $key => $date) {
            $chart_data[$date->format('Y-m-d')] = 0;
        }
        dd($chart_data);

        $orders = DB::table('orders')->select(DB::raw(' DATE(created_at) as day'), DB::raw('SUM(price) as amount'))
            ->whereBetween('created_at', [$start_date, $end_date])
            ->groupBy('day')
            ->get();

        foreach ($orders as $order) {
            $chart_data[$order->day] = $order->amount;
        }
        dd($chart_data);
        return $chart_data;
    }
}
