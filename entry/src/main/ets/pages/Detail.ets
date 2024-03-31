import router from '@ohos.router'

@Entry
@Component
struct Detail {
  @State orderId: string = router.getParams()['id']

  build() {
    Column() {
      Text("detail:" + this.orderId)
      Button("返回").onClick(_ => {
        try {
          // 返回第一页
          router.back()
          console.info('Succeeded in returning to the first page.')
        } catch (err) {
          console.error(`Failed to return to the first page.Code is ${err.code}, message is ${err.message}`)
        }
      })
    }
  }
}