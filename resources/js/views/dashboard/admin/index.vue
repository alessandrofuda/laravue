<template>
  <div class="dashboard-editor-container">
    <github-corner style="position: absolute; top: 0px; border: 0; right: 0;" />

    <panel-group @handleSetLineChartData="handleSetLineChartData" />

    <el-row style="background:#fff;padding:16px 16px 0;margin-bottom:32px;">
      <div class="date-range-block">
        <span class="card-panel-text">... work in progress ...  Select date:</span>
        <el-date-picker
          v-model="datesRange"
          class="date-range-input"
          type="daterange"
          align="right"
          unlink-panels
          range-separator="To"
          start-placeholder="Start date"
          end-placeholder="End date"
          :picker-options="pickerOptions"
          @change="refreshLineChartByDates"
        />
        <!-- <el-button class="el-button el-button--primary el-button--mini" @click="refreshLineChartByDates">Apply</el-button> -->
        <div class="data-aggregation-block">
          <div class="data-aggregation">
            <el-radio-group v-model="aggregation" size="small" @change="setAggregationLevel">
              <el-radio-button label="Daily" />
              <el-radio-button label="Weekly" />
              <el-radio-button label="Monthly" />
            </el-radio-group>
          </div>
        </div>
      </div>
      <line-chart :chart-data="lineChartData" />
    </el-row>

    <el-row :gutter="32">
      <el-col :xs="24" :sm="24" :lg="8">
        <div class="chart-wrapper">
          <raddar-chart />
        </div>
      </el-col>
      <el-col :xs="24" :sm="24" :lg="8">
        <div class="chart-wrapper">
          <pie-chart />
        </div>
      </el-col>
      <el-col :xs="24" :sm="24" :lg="8">
        <div class="chart-wrapper">
          <bar-chart />
        </div>
      </el-col>
    </el-row>
    <el-row :gutter="8">
      <el-col :xs="{span: 24}" :sm="{span: 24}" :md="{span: 24}" :lg="{span: 12}" :xl="{span: 12}" style="padding-right:8px;margin-bottom:30px;">
        <transaction-table />
      </el-col>
      <el-col :xs="{span: 24}" :sm="{span: 12}" :md="{span: 12}" :lg="{span: 6}" :xl="{span: 6}" style="margin-bottom:30px;">
        <todo-list />
      </el-col>
      <el-col :xs="{span: 24}" :sm="{span: 12}" :md="{span: 12}" :lg="{span: 6}" :xl="{span: 6}" style="margin-bottom:30px;">
        <box-card />
      </el-col>
    </el-row>
  </div>
</template>

<script>
import GithubCorner from '@/components/GithubCorner';
import PanelGroup from './components/PanelGroup';
import LineChart from './components/LineChart';
import RaddarChart from './components/RaddarChart';
import PieChart from './components/PieChart';
import BarChart from './components/BarChart';
import TransactionTable from './components/TransactionTable';
import TodoList from './components/TodoList';
import BoxCard from './components/BoxCard';
import { getAmountsByDateRange } from '@/api/order';

const xAxisData = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
const lineChartData = {
  newVisitis: {
    xAxisData: xAxisData,
    expectedData: [100, 120, 161, 134, 105, 160, 165],
    actualData: [120, 82, 91, 154, 162, 140, 145],
  },
  messages: {
    xAxisData: xAxisData,
    expectedData: [200, 192, 120, 144, 160, 130, 140],
    actualData: [180, 160, 151, 106, 145, 150, 130],
  },
  purchases: {
    xAxisData: xAxisData,
    expectedData: [80, 100, 121, 104, 105, 90, 100],
    actualData: [120, 90, 100, 138, 142, 130, 130],
  },
  shoppings: {
    xAxisData: xAxisData,
    expectedData: [130, 140, 141, 142, 145, 150, 160],
    actualData: [120, 82, 91, 154, 162, 140, 130],
  },
};

export default {
  name: 'DashboardAdmin',
  components: {
    GithubCorner,
    PanelGroup,
    LineChart,
    RaddarChart,
    PieChart,
    BarChart,
    TransactionTable,
    TodoList,
    BoxCard,
  },
  data() {
    return {
      aggregation: 'Daily',
      lineChartData: lineChartData.newVisitis,
      pickerOptions: {
        disabledDate(time) {
          return time.getTime() > Date.now();
        },
        shortcuts: [{
          text: 'Last week',
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            start.setTime(start.getTime() - 3600 * 1000 * 24 * 7);
            picker.$emit('pick', [start, end]);
          },
        }, {
          text: 'Last month',
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            start.setTime(start.getTime() - 3600 * 1000 * 24 * 30);
            picker.$emit('pick', [start, end]);
          },
        }, {
          text: 'Last 3 months',
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            start.setTime(start.getTime() - 3600 * 1000 * 24 * 90);
            picker.$emit('pick', [start, end]);
          },
        }],
      },
      datesRange: '',
      dataAggregationLevel: 'Daily',
    };
  },
  methods: {
    setAggregationLevel(aggregationLevel) {
      if (this.datesRange.length === 0) {
        alert('Please select a date range before..');
        return;
      }
      this.dataAggregationLevel = aggregationLevel;
      this.refreshLineChartByDates();
    },
    handleSetLineChartData(type) {
      this.lineChartData = lineChartData[type];
    },
    async refreshLineChartByDates() { // work in progress..
      var { actualData, expectedData, xAxisData } = await getAmountsByDateRange(this.datesRange, this.dataAggregationLevel);
      this.lineChartData = {
        actualData: actualData,
        expectedData: expectedData,
        xAxisData: xAxisData, // ['MAon', 'TuAe', 'Wsded', 'Tshu', 'aFri', 'Sat', 'Sun'],
      };
    },
  },
};
</script>
<style rel="stylesheet/scss" lang="scss"> /* without scope ! */
    .el-date-editor .el-range-separator {
      width: 7%;
    }
</style>
<style rel="stylesheet/scss" lang="scss" scoped>
  .dashboard-editor-container {
    padding: 32px;
    background-color: rgb(240, 242, 245);
    .chart-wrapper {
      background: #fff;
      padding: 16px 16px 0;
      margin-bottom: 32px;
    }
  }
  .date-range-block {
    text-align: right;
    margin-bottom: 20px;
    button {
      height: 35px;
      position: relative;
      top: -1px;
    }
  }
  .data-aggregation-block {
    display: inline-block;
    margin-left: 20px;
  }
</style>
