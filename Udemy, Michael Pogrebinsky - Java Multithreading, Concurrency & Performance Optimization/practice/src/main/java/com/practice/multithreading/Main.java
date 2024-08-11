package com.practice.multithreading;

public class Main {
    public static void main(String[] args) {
        Thread thread = new Thread(new Runnable() {
            public void run() {
                System.out.println("Thread " + Thread.currentThread().getName() + " is running");
                throw new RuntimeException("Sup");
            }
        });
        thread.setUncaughtExceptionHandler(new Thread.UncaughtExceptionHandler() {
            @Override
            public void uncaughtException(Thread t, Throwable e) {
                System.err.println("Thread " + t.getName() + " encountered error: " + e.getLocalizedMessage());
            }
        });
        thread.setName("Sample Thread");
        thread.start();
        System.out.println("After start()");
        try {
            Thread.sleep(1000);
        } catch (Exception e) {
            System.err.println("ERROR: " + e.getLocalizedMessage());
        }
        System.out.println("After sleep()");
    }
}
