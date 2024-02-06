package com.mycompany.app;

/**
 * Hello world!
 * test hello jenkins build
 */
public class App {

    private static final String MESSAGE = "Hello Jenkins!";

    public App() {}

    public static void main(String[] args) {
        System.out.println(MESSAGE);
    }

    public String getMessage() {
        return MESSAGE;
    }
}
