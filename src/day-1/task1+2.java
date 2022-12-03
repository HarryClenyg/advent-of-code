package src.day1;

import java.io.FileReader;
import java.io.IOException;
import java.util.*;

public class CalorieCounter {
    // include throws to handle some file handling exceptions
    public static void main(String[] args)
            throws IOException {
        // arraylist to store strings
        List<String> listOfStrings
                = new ArrayList<String>();

        // load content of file based on specific delimiter
        Scanner sc = new Scanner(new FileReader("src/day1/aoc-data-1-1.txt"))
                .useDelimiter("\\r\\n");
        String str;

        // checking end of file
        while (sc.hasNext()) {
            str = sc.next();

            // adding each string to arraylist
            listOfStrings.add(str);
        }

        // convert any arraylist to array of integers
        List<Integer> calories = new ArrayList<Integer>(listOfStrings.size());
        for (String elf : listOfStrings) {
            if (isNumeric(elf)) {
                calories.add(Integer.parseInt(elf));
            }else{
                calories.add(0);
            }
        }

        List<Integer> totalCalories = new ArrayList<Integer>();
        int caloriesCarried = 0;
        int i = 0;

        while (i < calories.size()) {
            if(calories.get(i) == 0) {
                totalCalories.add(caloriesCarried);
                caloriesCarried = 0;
            }else{
                caloriesCarried += calories.get(i);
            }
            i++;
        }
        totalCalories.add(caloriesCarried);

        // part1
        System.out.print(Collections.max(totalCalories));
        // part2
        Collections.sort(totalCalories);
        int topThree = totalCalories.get(totalCalories.size() - 1)
                + totalCalories.get(totalCalories.size() - 2)
                    + totalCalories.get(totalCalories.size() - 3);

        System.out.println("");
        System.out.println(topThree);

    }

    public static boolean isNumeric(String strNum) {
        try {
            int d = Integer.parseInt(strNum);
        } catch (NumberFormatException nfe) {
            return false;
        }
        return true;
    }
}
