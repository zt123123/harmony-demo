import { IFilterItem } from '../common/interface';
import FilterBar from '../components/filterbar';
import NavBar from '../components/navbar';
import NoticeBar from '../components/noticebar';
import OrderListWidget from '../components/orderlist';
import SearchBar from '../components/searchbar';
import SortBar from '../components/sortbar';
import OrderItem from '../model/OrderItem';
import OrderList from '../model/OrderList';


@Entry
@Component
struct Index {
  @State tabList: Array<string> = ['进行中', '已完成', '已关闭'];
  @State orderList: OrderItem[] = []
  @State visible: boolean = true
  @State refreshing: boolean = false
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()
  @State filterList: IFilterItem[] = [
    { title: "待发货", count: 521 },
    { title: "待付款", count: 0 },
    { title: "已发货", count: 2 },
    { title: "退款/售后", count: 52 },
    { title: "待回访", count: 0 },
  ]

  aboutToAppear() {
    this.orderList = OrderList.getOrderList()
  }

  @Builder TabBuilder(item: string, index: number) {
    Column() {
      Text(item)
        .fontColor(this.currentIndex === index ? "#d91b1b" : "#aaa")
        .fontSize(12)
        .fontWeight(500)
        .margin({ top: 14})
      Row()
        .width(28)
        .height(2)
        .margin({ top: 9})
        .borderRadius(12)
        .backgroundColor(this.currentIndex === index ? "#d91b1b" : Color.Transparent)
    }
    .backgroundColor(Color.White)
    .width("100%")
    .height(40)
    .border({
      color: "#eee",
      width: { bottom: 1 },
      style: {
        bottom: BorderStyle.Solid
      }
    })
  }

  build() {
    Column() {
      NavBar()
      Refresh({ refreshing: $$this.refreshing }) {
        Column() {
          SearchBar()
          Tabs({ controller: this.controller }) {
            ForEach(this.tabList, (item: string, index) => {
              TabContent() {
                Column() {
                  if (index == 0) {
                    FilterBar({
                      filterList: $filterList,
                      activeIndex: 0
                    })
                    NoticeBar({ visible: this.visible })
                  }
                  SortBar()
                  OrderListWidget({ orderList: $orderList })
                }.width("100%")
              }
              .tabBar(this.TabBuilder(item, index))
            })
          }
          .barHeight(40)
          .onChange((index: number) => {
            this.currentIndex = index
          })
        }.width("100%")
      }.onRefreshing(() => {
        setTimeout(_ => {
          this.refreshing = false
        }, 1000)
      })
    }
    .backgroundColor(0xeeeeee)
    .height("100%")
    .width("100%")
  }
}
