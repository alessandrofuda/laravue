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

    private function setDataAggregationLevelForCarbon($aggregationLevel) {
        switch ($aggregationLevel) {
            case "Daily":
                $aggregationLevel = '1 day';
                break;
            case "Weekly":
                $aggregationLevel = '1 week';
                break;
            case "Monthly":
                $aggregationLevel = '1 month';
                break;
            default:
                $aggregationLevel = '1 day';
        }
        return $aggregationLevel;
    }

    public function getChartData($dateRange, $aggregationLevel) {
        if(!$dateRange) {
            return [];
        }
        $start_date = $this->setTimezoneToStartEndDates($dateRange)[0];
        $end_date = $this->setTimezoneToStartEndDates($dateRange)[1];
        $aggregationLevel_carbon_label = $this->setDataAggregationLevelForCarbon($aggregationLevel);

        // dump($aggregationLevel);

        $period = CarbonPeriod::create($start_date, $aggregationLevel_carbon_label, $end_date);
        $chart_data = [];
        foreach ($period as $key => $date) {
            $chart_data[$date->format('Y-m-d')] = 0;
        }

        // group by day query
//        $orders = DB::table('orders')
//              ->select(DB::raw(' DATE(created_at) as day'), DB::raw('SUM(price) as amount'))
//              ->whereBetween('created_at', [$start_date, $end_date])
//              ->orderBy('created_at')
//              ->groupBy('day')
//              ->get();

        // group by month query
//        $orders = DB::table('orders')
//                ->select(DB::raw('DATE_FORMAT(created_at, "%Y-%m") as month'), DB::raw('SUM(price) as amount'))
//                ->whereBetween('created_at', [$start_date, $end_date])
//                ->orderBy('created_at')
//                ->groupBy(DB::raw('MONTH(created_at)'), DB::raw('YEAR(created_at)'))
//                ->get();

        // group by week query
        // ... TODO ...

        // group by dynamic quesry
        $orders = DB::table('orders')
            ->when($aggregationLevel == 'Daily', function($query) {
                return $query->select(DB::raw(' DATE(created_at) as day'), DB::raw('SUM(price) as amount'));
            })
            ->when($aggregationLevel == 'Monthly', function($query) {
                return $query->select(DB::raw('DATE_FORMAT(created_at, "%Y-%m") as month'), DB::raw('SUM(price) as amount'));
            })
            ->whereBetween('created_at', [$start_date, $end_date])
            ->orderBy('created_at')
            ->when($aggregationLevel == 'Daily', function($query) {
                return $query->groupBy('day');
            })
            ->when($aggregationLevel == 'Monthly', function($query) {
                return $query->groupBy(DB::raw('MONTH(created_at)'), DB::raw('YEAR(created_at)'));
            })
            ->get();

        if ($aggregationLevel == 'Daily') {
            foreach ($orders as $order) {
                $chart_data[$order->day] = $order->amount;
            }
        } elseif ($aggregationLevel == 'Monthly') {
            $chart_data_per_month = [];
            foreach ($chart_data as $date => $value) {
                $chart_data_per_month[substr($date, 0, 7)] = $value;
            }
            foreach ($orders as $order) {
                $chart_data_per_month[$order->month] = $order->amount;
            }
            // dump($chart_data_per_month);
            $chart_data = $chart_data_per_month;
        } // elseif ($aggregationLevel == 'Weekly') {
            //
        // }

        // dd($chart_data); TODO refactoring
        return $chart_data;
    }
}
