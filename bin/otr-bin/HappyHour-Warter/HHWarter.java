import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;


public class HHWarter
{
  public static void main(String[] args) {
    int startHour = Integer.parseInt(args[0]);
    int endHour = Integer.parseInt(args[1]);

    System.err.println("Happy hour starts at "+startHour+" and ends at "+endHour);
    System.err.println(SimpleDateFormat.getDateTimeInstance().format(new Date()));

    Calendar now = Calendar.getInstance();
    int hour = now.get(Calendar.HOUR_OF_DAY);

    if (hour > startHour && hour < endHour) {
      System.out.println("Kein Grund zu warten, es ist schon Happy Hour.");
      System.err.println(SimpleDateFormat.getDateTimeInstance().format(new Date()));
    } else {
      TimerTask task = new TimerTask()
        {
          public void run() {
            System.out.println("OK, die Zeit ist gekommen. Weiter gehts.");
            System.err.println(SimpleDateFormat.getDateTimeInstance().format(new Date()));
            System.exit(0);
          }
        };

      now.set(Calendar.HOUR_OF_DAY, 2);
      now.set(Calendar.MINUTE, 1);
      now.set(Calendar.SECOND, 0);

      if (hour > endHour) {
        now.add(Calendar.DAY_OF_MONTH, 1);
      }

      (new Timer()).schedule(task, now.getTime());
    }
  }
}
