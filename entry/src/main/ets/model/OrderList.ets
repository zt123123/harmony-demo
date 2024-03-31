import OrderItem, { OrderStatus } from './OrderItem'
import json from "../mock/data"



export default class OrderList {
  static  getOrderList() {
    return json.result.orderList.map(item => new OrderItem(
      {
        orderId: item.orderId,
        quantity: item.quantity,
        orderDesc: item.orderDesc,
        imgHead: item.imgHead,
        addTime: item.addTime,
        totalPrice: item.totalPrice,
        status: item.status,
        statusDesc: item.statusDesc
      }
    ))
  }
}

