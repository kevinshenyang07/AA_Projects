const APIUtil = {
  followUser: id => APIUtil.changeFollowStatus(id, "POST"),
  unfollowUser: id => APIUtil.changeFollowStatus(id, "DELETE"),

  changeFollowStatus: (id, method) => (
    $.ajax({
      url: `/users/${id}/follow`,
      dataType: "json",
      method
    })
  ),

  searchUsers: (queryVal, success) => (
    $.ajax({
      url: "/users/search",
      method: "GET",
      dataType: "json",
      data: { query: queryVal },
      success
    })
  )

};

module.exports = APIUtil;
