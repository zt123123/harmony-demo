@Extend(Text) function fancyText(
    size: number,
    color: string | Color) {
  .fontSize(size)
  .fontColor(color)
}

@Component
export default struct NavBar {
  build() {
    Row() {
      Image($r("app.media.icon")).width(18)
      Text("订单管理").fancyText(18, '#FFFFFF')
      Text("帮助").fancyText(14, '#FFFFFF')
    }
    .width("100%")
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
    .backgroundColor('#d91b1b')
    .height(40)
    .padding({
      left: 8,
      right: 8
    })
  }
}
