package org.example;

import pl.allegro.finance.tradukisto.internal.IntegerToStringConverter;
import pl.allegro.finance.tradukisto.internal.LongToStringConverter;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class LanguageTester {
    private final PrintWriter writer;
    private final BufferedReader reader;

    private final int[] integerNumbers = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19, 10, 20, 30, 40,
            50, 60, 70, 80, 90, 21, 37, 43, 58, 69, 76, 82, 95, 100, 200, 300, 400, 500, 600, 700, 800, 900, 111, 272, 387, 448,
            569, 625, 782, 895, 999, 1000, 2000, 3000, 4000, 5000, 7634, 11000, 15000, 21000, 24190, 653000, 123454, 700000,
            999_999, 1_000_000, 2_000_000, 5_000_000, 23_437_219, 100_000_000, 121_000_000, 123_456_789, 322_089_890,
            1_000_000_000, 2_147_483_647, 126, 663, 123, 436, 123, 7456, 236, 34623532, 7544354, 43632421, 345325324};

    private final long[] longNumbers = {5_000_000_000L, 1_000_000_000_000L, 2_000_000_000_000L, 5_000_000_000_000L,
            1_000_000_000_000_000L, 2_000_000_000_000_000L, 5_000_000_000_000_000L, 1_000_000_000_000_000_000L,
            2_000_000_000_000_000_000L, 2_135_346_346_234_123_789L};

    public LanguageTester(PrintWriter writer, BufferedReader reader) {
        this.writer = writer;
        this.reader = reader;
    }

    public void test() throws IOException {
        for (Language language : Language.values()) {
            writer.println(getIntTestMessageForLanguage(language));
            writer.flush();

            System.out.println(language.name());
            System.out.println("For ints:");
            checkResultForInts(reader.readLine(), language);

            if (language.getLongToStringConverter() != null) {
                writer.println(getLongTestMessageForLanguage(language));
                writer.flush();

                System.out.println("For longs:");
                checkResultForLongs(reader.readLine(), language);
            }
        }
    }

    private String getIntTestMessageForLanguage(Language language) {
        return String.format("languages int %s %s", language.name(),
                Arrays.stream(integerNumbers).mapToObj(String::valueOf).collect(Collectors.joining(" ")));
    }

    private String getLongTestMessageForLanguage(Language language) {
        return String.format("languages long %s %s", language.name(),
                Arrays.stream(longNumbers).mapToObj(String::valueOf).collect(Collectors.joining(" ")));
    }

    public void checkResultForInts(String result, Language language) {
        IntegerToStringConverter integerToStringConverter = language.getIntegerToStringConverter();
        String[] dartResults = result.split(", ");
        List<String> mistakes = new ArrayList<>();

        for(int i = 0; i < integerNumbers.length; i++) {
            String expected = integerToStringConverter.asWords(integerNumbers[i]);
            if (!dartResults[i].equals(expected)) {
                mistakes.add(String.format("Wrong result for %d, expected - %s, but was - %s", integerNumbers[i], expected, dartResults[i]));
            }
        }

        if (mistakes.size() == 0) {
            System.out.println("Correct");
        } else {
            mistakes.forEach(System.out::println);
        }
    }

    public void checkResultForLongs(String result, Language language) {
        LongToStringConverter longToStringConverter = language.getLongToStringConverter();
        String[] dartResults = result.split(", ");
        List<String> mistakes = new ArrayList<>();

        for(int i = 0; i < longNumbers.length; i++) {
            String expected = longToStringConverter.asWords(longNumbers[i]);
            if (!dartResults[i].equals(expected)) {
                mistakes.add(String.format("Wrong result for %d, expected - %s, but was - %s", longNumbers[i], expected, dartResults[i]));
            }
        }

        if (mistakes.size() == 0) {
            System.out.println("Correct");
        } else {
            mistakes.forEach(System.out::println);
        }
    }
}
