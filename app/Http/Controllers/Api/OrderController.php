<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Laravue\LineChart;
use App\Laravue\Faker;
use App\Laravue\JsonResponse;
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
        $line_chart = new LineChart;
        $chart_data = $line_chart->getChartData($request['dateRange'], $request['aggregationLevel']);

        return response()->json(['expectedData' => null, 'actualData' => array_values($chart_data), 'xAxisData' => array_keys($chart_data)]);
    }
}
