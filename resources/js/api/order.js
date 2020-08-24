import request from '@/utils/request';

export function fetchList(query) {
  return request({
    url: '/orders',
    method: 'get',
    params: query,
  });
}

export function getAmountsByDateRange(dateRange) {
  return request({
    url: '/orders-amounts-by-date-range',
    method: 'get',
    params: dateRange,
  });
}
