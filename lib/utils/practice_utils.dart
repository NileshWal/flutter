class PracticeUtils {
  //Screen Titles
  static const String taskScreenTitle = 'My Tasks';

  //Regex Patterns
  static Pattern userNamePattern = r"^[A-Za-z][A-Za-z0-9_]{7,29}$";
  static Pattern passwordPattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>';

  //Login Screen Text Labels
  static const String usernameLabel = 'Username';
  static const String validUsername = 'Valid username';
  static const String inValidUsername = 'Enter a valid username';
  static const String passwordLabel = 'Password';
  static const String validPassword = 'Password correct';
  static const String inValidPassword = 'Password not as per policy';

  static const String addTaskTitle = 'Add some tasks';
  static const String addNewTaskTitle = 'Add a task';
  static const String editExistingTaskTitle = 'Edit task';
  static const String taskHint = 'Task';
  static const String yourTaskTitle = 'Your task';


  static const String saveTodoDateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
}
