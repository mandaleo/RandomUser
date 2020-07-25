import Moya

extension Networking {
  func moya<T: TargetType>() -> MoyaProvider<T> {
    return MoyaProvider()
  }
}
