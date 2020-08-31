<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Laravue\Faker;
use App\Laravue\JsonResponse;
use Carbon\Carbon;
use Carbon\CarbonPeriod;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function index() {
        $rowsNumber = 8;
        $data = [];
        for ($rowIndex = 0; $rowIndex < $rowsNumber; $rowIndex++) {
            $row = [
                'order_no' => 'DEMO' . mt_rand(1000000, 9999999),
                'price' => mt_rand(10000, 999999),
                'status' => Faker::randomInArray(['success', 'pending']),
            ];

            $data[] = $row;
        }

        return response()->json(new JsonResponse(['items' => $data]));
    }

    public function getByDatesRange(Request $request) {

        $dates = collect($request['dateRange'])->map(function ($date) {
            $date = Carbon::createFromFormat('Y-m-d\TH:i:s.uO', $date);
            $date->setTimezone('Europe/Rome');
            return $date;
        });
        // $dates_aggregation_level = $request['aggregationLevel'];

        $period = CarbonPeriod::create($dates[0], '1 day', $dates[1]);
        $itemsPeriod = [];
        foreach ($period as $key => $date) {
            $itemsPeriod[] = $date->format('m-d');
        }

        $expectedData = [800, 100, 1721, 1104, 1705, 990, 1200];
        $actualData = [1720, 990, 1400, 1938, 1442, 1310, 1030];
        $xAxisData = $itemsPeriod;
        return response()->json(['expectedData' => $expectedData, 'actualData' => $actualData, 'xAxisData' => $xAxisData]);
    }
}
