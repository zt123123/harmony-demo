@Component
export default struct SortBar {
  build() {
    Row() {
      Text("按支付时间由进及远").fontSize(14)
    }.width("100%").height(40).padding(16).bindMenu(this.MyMenu)
  }

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: $r("app.media.icon"), content: "菜单选项" })
      MenuItem({ startIcon: $r("app.media.icon"), content: "菜单选项" })
    }
  }
}