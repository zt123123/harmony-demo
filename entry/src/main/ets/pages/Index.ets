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

  build() {
    Column() {
      NavBar()
      Refresh({ refreshing: $$this.refreshing }) {
        Column() {
          SearchBar()
          Tabs() {
            ForEach(this.tabList, (item, index) => {
              TabContent() {
                Column() {
                  if (index == 0) {
                    FilterBar({
                      filterList: $filterList,
                      activeIndex: 0
                    })
                  }
                  NoticeBar({ visible: this.visible })
                  SortBar()
                  OrderListWidget({ orderList: $orderList })
                }.width("100%")
              }.tabBar(item)
            })
          }.layoutWeight(1)
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
