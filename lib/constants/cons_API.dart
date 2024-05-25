// String _root = 'http://192.168.1.8:8000'; //d-link
// String _root = 'http://192.168.8.163:8000'; //aden-net
// String _root = 'http://192.168.254.254:8000';
String _root = 'http://192.168.40.103:8000';

class APIRoute {
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
  static String searchJobs(searchText) {
    return '$_root/search/search?q=$searchText';
  }
  
  static String jobCreate = '$_root/job/create';
  static String getLatestJobs = '$_root/job/getLatestJobs';
  static String handleCVRequest = '$_root/job/handleCVRequest';
  static String getJobsByCompanyId(id) {
    return '$_root/job/getJobsByCompanyId/$id';
  }
  static String follow = '$_root/follo/follower';
  static String unFollow = '$_root/follo/unFollowUser';
  static String checkIfUserFollows = '$_root/follo/checkIfUserFollows';
}
