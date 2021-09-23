import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

public class main {
    public static void main(String[] args) {
        int n = 30;
        String AlphaString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

        ArrayList<Character> stringArr = new ArrayList<>();

        for (int i = 0; i < n; i++) {

            int index
                    = (int) (AlphaString.length()
                    * Math.random());

            Character charString = AlphaString
                    .charAt(index);

            stringArr.add(charString);
        }

        Collections.sort(stringArr);

        System.out.println(stringArr);

    }
}
