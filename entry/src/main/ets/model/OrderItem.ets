export enum OrderStatus {
  WAIT_SEND,
  WAIT_PAY,
  HAS_SEND,
  REFUND,
  REVIEW
}

@Observed
class OrderItem {
  orderId: number
  quantity: number
  imgHead: string
  addTime: string
  totalPrice: number | string
  status: OrderStatus
  orderDesc: string
  statusDesc: string

  constructor(
    {
      orderId,
      quantity,
      imgHead,
      addTime,
      totalPrice,
      status,
      orderDesc,
      statusDesc
    }
  ) {
    this.orderId = orderId
    this.quantity = quantity
    this.imgHead = imgHead
    this.addTime = addTime
    this.totalPrice = totalPrice
    this.status = status
    this.orderDesc = orderDesc
    this.statusDesc = statusDesc
  }
}


export default OrderItem