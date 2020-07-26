extension Networking {
  var listUsers: ListUsersUseCase {
    return ListUser(repository: userRespository)
  }
}
