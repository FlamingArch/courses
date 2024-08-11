package com.flamingarch.java.multithreading.fundamentals;

public class Main {
    public static void main(String[] args) {
        Thread thread = new Thread(new Runnable() {
            @Override
            public void run() {
                // Code will run in a new thread
                System.out.println("We are now in thread " + Thread.currentThread().getName());
                System.out.println("Current thread priority is " + Thread.currentThread().getPriority());
            }
        });
        // Set the static component of dynamic priority (OS uses in scheduling)
        // dynamicPriority = staticPriority + Bonus
        // Bonus is determined by operating system, can be +ve or -ve
        thread.setPriority(Thread.MAX_PRIORITY);
        thread.setName("New Worker Thread");
        System.out.println("We are in thread: " + Thread.currentThread().getName() + " before starting a new thread");
        thread.start();
        System.out.println("We are in thread: " + Thread.currentThread().getName() + " after starting a new thread");
        try {
            // Tells current thread to sleep for a given miliseconds.
            // Instructs OS to not schedule thread until time passes
            Thread.sleep(1000);
        } catch (Exception e) {
            System.out.println(e);
        }

        // Lambda syntax for Java8 or later
        Thread threadWillError = new Thread(() -> {
            throw new RuntimeException("Intentional Exception");
        });
        threadWillError.setName("Misbehaving thread");
        threadWillError.setUncaughtExceptionHandler(new Thread.UncaughtExceptionHandler() {
            @Override
            public void uncaughtException(Thread t, Throwable e) {
                System.out.println(
                        "A critical error has happened in thread" + t.getName() + ", error is: " + e.getMessage());
            };
        });
        threadWillError.start();

    }
}
