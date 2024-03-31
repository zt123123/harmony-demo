import router from '@ohos.router'
import OrderItem from '../model/OrderItem'

@Extend(Text) function fancyText(
    size: number,
    color: string | Color) {
  .fontSize(size)
  .fontColor(color)
}

@Component
export default struct OrderListWidget {
  @Link orderList: OrderItem[]

  build() {
    List() {
      ForEach(this.orderList, (item: OrderItem) => {
        ListItem() {
          Row() {
            Column() {
              Stack({ alignContent: Alignment.Bottom }) {
                Image(item.imgHead).width(68).height(68).backgroundColor(Color.Grey)
                Row() {
                  Text(`共${item.quantity}件`).fancyText(12, Color.White)
                }
                .justifyContent(FlexAlign.Center)
                .backgroundColor(Color.Black)
                .opacity(0.7)
                .height(20)
                .width(68)
              }
            }.margin({ right: 8 })

            Column() {
              Text(item.orderDesc).margin({ bottom: 8 })
              Text(`支付时间：${item.addTime}`).fancyText(12, "#aaa").margin({ bottom: 8 })
              Text(`支付金额：￥${item.totalPrice}`).fancyText(12, "#aaa")
            }
            .justifyContent(FlexAlign.Start)
            .alignItems(HorizontalAlign.Start)
            .layoutWeight(1)

            Column() {
              Text(item.statusDesc).fancyText(14, Color.Orange)
              Button("发货", { type: ButtonType.Normal, stateEffect: true })
                .borderRadius(4)
                .fontColor(Color.Black)
                .fontSize(12)
                .border({
                  style: BorderStyle.Solid,
                  color: '#eee',
                  width: 1
                })
                .backgroundColor(Color.White)
                .height(28)
            }
            .justifyContent(FlexAlign.SpaceBetween)
            .alignItems(HorizontalAlign.End)
            .height("100%")
          }
          .onClick(_ => {
            router.pushUrl({
              url: "pages/Detail",
              params: {
                id: item.orderId
              }
            }).then(() => {
              console.info('Succeeded in jumping to the second page.')
            }).catch((err) => {
              console.error(`Failed to jump to the second page.Code is ${err.code}, message is ${err.message}`)
            })
          })
          .alignItems(VerticalAlign.Top)
          .backgroundColor(Color.White)
          .padding(16)
          .width("100%")
          .height(100)
          .margin({
            bottom: 8
          })
        }
      })
    }.width("100%").height("100%")
  }
}
