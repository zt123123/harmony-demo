@Extend(Text) function fancyText(
    size: number,
    color: string | Color) {
  .fontSize(size)
  .fontColor(color)
}

@Component
export default struct SearchBar {
  build() {
    Row() {
      Image($r("app.media.icon")).width(24).margin({ left: 8, right: 8 })
      Search({ value: "", placeholder: "商品名、单号、收货人、下单模板" })
        .placeholderFont(
          {
            size: 12
          }
        )
        .layoutWeight(1)
        .placeholderColor("#cccccc")
        .backgroundColor(Color.White)
        .borderRadius(4)
        .height(36)
      Image($r("app.media.icon")).width(18).margin({ left: 8, right: 8 })
      Text("筛选").fancyText(14, '#FFFFFF').margin({ right: 8 })
    }.backgroundColor('#d91b1b')
  }
}
