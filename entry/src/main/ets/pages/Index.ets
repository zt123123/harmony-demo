import { IFilterItem } from '../common/interface';
import FilterBar from '../components/filterbar';
import NavBar from '../components/navbar';
import NoticeBar from '../components/noticebar';
import OrderListWidget from '../components/orderlist';
import SearchBar from '../components/searchbar';
import SortBar from '../components/sortbar';
import OrderItem from '../model/OrderItem';
import OrderList from '../model/OrderList';
import OrderItemWidget from '../components/orderitem';
import { PullToRefresh } from '@ohos/pulltorefresh'


@Entry
@Component
struct Index {
  @State tabList: Array<string> = ['进行中', '已完成', '已关闭'];
  @State orderList: OrderItem[] = []
  @State visible: boolean = true
  @State refreshing: boolean = false
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()
  private scroller: Scroller = new Scroller();
  @State refreshText: string = '';
  @State filterList: IFilterItem[] = [
    { title: "待发货", count: 521 },
    { title: "待付款", count: 0 },
    { title: "已发货", count: 2 },
    { title: "退款/售后", count: 52 },
    { title: "待回访", count: 0 },
  ]

  aboutToAppear() {
    this.initData()
  }

  initData() {
    return this.orderList = OrderList.getOrderList()
  }

  @Builder TabBuilder(item: string, index: number) {
    Column() {
      Text(item)
        .fontColor(this.currentIndex === index ? "#d91b1b" : "#aaa")
        .fontSize(12)
        .fontWeight(500)
        .margin({ top: 14 })
      Row()
        .width(28)
        .height(2)
        .margin({ top: 9 })
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

  @Builder
  private getListView() {
    List({ scroller: this.scroller }) {
      ForEach(this.orderList, (item: OrderItem) => {
        ListItem() {
          OrderItemWidget({ item: item })
        }
      })
    }
    .width("100%").height("100%").edgeEffect(EdgeEffect.None)
  }

  build() {
    Column() {
      NavBar()

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
                PullToRefresh({
                  data: $orderList,
                  scroller: this.scroller,
                  customList: () => {
                    this.getListView();
                  },
                  onRefresh: () => {
                    return new Promise<string>((resolve, reject) => {
                      setTimeout(() => {
                        resolve('刷新成功');
                        this.orderList = this.initData();
                      }, 1000);
                    });
                  },
                  onLoadMore: () => {
                    return new Promise<string>((resolve, reject) => {
                      setTimeout(() => {
                        resolve('');
                        this.orderList = this.orderList.concat(new Array(20).fill(new OrderItem({
                          orderId: 9999,
                          quantity: 9999,
                          imgHead: 'https://si.geilicdn.com/pcdecorate1487527478-44fd0000018920369ac10a20e284-unadjust_350_350.jpeg?w=110&h=110&cp=1',
                          addTime: '2024-03-18 17:11:00',
                          totalPrice: 9999,
                          status: 1,
                          orderDesc: '新增订单描述',
                          statusDesc: '新增退款描述'
                        })));
                      }, 1000);
                    });
                  },
                  customLoad: null,
                  customRefresh: null,
                })
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

    }
    .backgroundColor(0xeeeeee)
    .height("100%")
    .width("100%")
  }
}
