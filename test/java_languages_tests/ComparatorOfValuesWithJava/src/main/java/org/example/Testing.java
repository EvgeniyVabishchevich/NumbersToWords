package org.example;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;

public class Testing {
    private PrintWriter writer;
    private BufferedReader reader;

    public void start() throws IOException {
        runDart();

        LanguageTester languageTester = new LanguageTester(writer, reader);

        languageTester.test();
    }

    public void runDart() throws IOException {
        Process process = Runtime.getRuntime().exec("dart run ..\\dart\\testing.dart");

        OutputStream outputStream = process.getOutputStream();
        writer = new PrintWriter(outputStream);

        reader = new BufferedReader(new InputStreamReader(process.getInputStream(), StandardCharsets.UTF_8));
    }
}
