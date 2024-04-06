import { SortItem } from '../common/interface'

@Component
export default struct SortBar {
  @State list: SortItem[] = [
    { id: 1, label: "按支付时间由近及远" },
    { id: 1, label: "按支付时间由远及近" },
    { id: 1, label: "按预约时间由近及远" },
    { id: 1, label: "按预约时间由远及近" },
  ]

  build() {
    Row() {
      Text("按支付时间由进及远").fontSize(14)
      Image($r("app.media.arrow_down")).width(16).margin({ left: 4 })
    }.width("100%").padding(16).bindMenu(this.MyMenu)
  }

  @Builder
  MyMenu() {
    Menu() {
      ForEach(this.list, (item: SortItem, index) => {
        MenuItem({ startIcon: $r("app.media.icon"), content: item.label })
      })
    }
  }
}