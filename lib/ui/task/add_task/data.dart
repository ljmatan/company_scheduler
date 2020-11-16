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

  static int _type;
  static int get type => _type;
  static void setType(int value) => _type = value;

  static int _subject;
  static int get subject => _subject;
  static void setSubject(int value) => _subject = value;

  static int _project;
  static int get project => _project;
  static void setProject(int value) => _project = value;

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
    setType(null);
    setSubject(null);
    setProject(null);
    setStartTime(null);
    setEndTime(null);
    setPrincipals(null);
  }
}
