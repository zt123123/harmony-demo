import { IFilterItem } from '../common/interface'
@Extend(Text) function fancyText(
    size: number,
    color: string | Color) {
  .fontSize(size)
  .fontColor(color)
}

@Component
export default  struct FilterBar {
  @Link filterList: IFilterItem[]
  @Prop activeIndex: number

  build() {
    Row() {
      ForEach(this.filterList, (item: IFilterItem, index) => {
        Column() {
          Text(item.count.toString())
            .margin({ bottom: 8 })
            .fancyText(16, index === this.activeIndex ? "#000000" : "#cccccc")
          Text(item.title).fancyText(14, index === this.activeIndex ? "#000000" : "#cccccc")
        }
        .layoutWeight(1)
        .onClick(_ => this.activeIndex = index)
      })
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor(Color.White)
    .padding({ top: 8, bottom: 8 })
  }
}
