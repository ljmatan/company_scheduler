abstract class NewTaskData {
  static String _taskName;
  static String get taskName => _taskName;
  static void setTaskName(String value) => _taskName = value;

  static String _description;
  static String get description => _description;
  static void setDescription(String value) => _description = value;

  static int _priority;
  static int get priority => _priority;
  static void setPriority(int value) => _priority = value;

  static List _types;
  static List get types => _types;
  static void setTypes(List value) => _types = value;

  static List _subjects;
  static List get subjects => _subjects;
  static void setSubjects(List value) => _subjects = value;

  static String _projectName;
  static String get projectName => _projectName;
  static void setProjectName(String value) => _projectName = value;

  static int _startTime;
  static int get startTime => _startTime;
  static void setStartTime(int value) => _startTime = value;

  static int _endTime;
  static int get endTime => _endTime;
  static void setEndTime(int value) => _endTime = value;

  static List _principals;
  static List get principals => _principals;
  static void setPrincipals(List value) => _principals = value;

  static void clear() {
    setTaskName(null);
    setDescription(null);
    setPriority(null);
    setTypes(null);
    setSubjects(null);
    setProjectName(null);
    setStartTime(null);
    setEndTime(null);
    setPrincipals(null);
  }
}
