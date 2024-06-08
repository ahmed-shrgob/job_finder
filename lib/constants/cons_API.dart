// String _root = 'http://192.168.1.8:8000'; //d-link
// String _root = 'http://192.168.8.163:8000'; //aden-net
// String _root = 'http://192.168.223.254:8000';
String _ip = '192.168.0.7';
String _root = 'http://$_ip:8000';

class APIRoute {
  static String socketRoot = '$_ip';
  static String login = '$_root/user/login';
  static String singup = '$_root/user/signup';
  static String companySignup = '$_root/user/signupCompany';
  static String getUserData(id) {
    return '$_root/users/getuser/$id';
  }

  static String createCV = '$_root/CV/create';
  static String getCV(id) {
    return '$_root/CV/getUserCvs/$id';
  }

  static String editCV(CVID) {
    return '$_root/CV/ubdateCV/$CVID';
  }

  static String GetAllCompanyJobs(companyId) {
    return '$_root/Company/getCompanyJobs/$companyId';
  }

  static String getTopFollowedCompanies =
      '$_root/Company/getTopFollowedCompanies';
  static String searchJobs(searchText) {
    return '$_root/search/search?q=$searchText';
  }

  static String filter = '$_root/search/filterJobs';
  static String jobCreate = '$_root/job/create';
  static String getLatestJobs = '$_root/job/getLatestJobs';
  static String handleCVRequest = '$_root/job/handleCVRequest';
  static String getJobsByCompanyId(id) {
    return '$_root/job/getJobsByCompanyId/$id';
  }
  static String getRequestsByUserId(id) {
    return '$_root/job/getRequestsByUserId/$id';
  }

  static String follow = '$_root/follo/follower';
  static String unFollow = '$_root/follo/unFollowUser';
  static String checkIfUserFollows = '$_root/follo/checkIfUserFollows';
  static String getCommuntis = "$_root/categoery/getAllCategories";
  static String getArticlesByType = "$_root/comm/getArticlesUserByType";
  static String createBlog = "$_root/blog/create/";
static String getUserBlogs(iD) {
    return "$_root/blog/getUserBlogs/$iD";
  }
}
