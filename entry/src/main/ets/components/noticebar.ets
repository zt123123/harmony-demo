@Extend(Text) function fancyText(
    size: number,
    color: string | Color) {
  .fontSize(size)
  .fontColor(color)
}

@Component
export default struct NoticeBar {
  @Prop visible: boolean

  build() {
    if (this.visible) {
      Row() {
        Row() {
          Text("促销量！试试商品分期免息")
            .fancyText(12, "#907145")
            .fontWeight(FontWeight.Bold)
            .margin({ right: 6 })
          Text("去查看")
            .fancyText(12, "#4384d8")
            .fontWeight(FontWeight.Bold)
        }

        Image($r("app.media.icon")).width(16).onClick(_ => {
          console.log("-------")
          this.visible = false
        })
      }
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.SpaceBetween)
      .width("100%")
      .height(30)
      .padding({ left: 16, right: 16 })
      .backgroundColor("#fef8ce")
    }
  }
}