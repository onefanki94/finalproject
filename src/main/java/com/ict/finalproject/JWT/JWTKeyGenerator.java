package com.ict.finalproject.JWT;


import java.security.SecureRandom;
import java.util.Base64;

public class JWTKeyGenerator {

        public static String generateKey() {
            SecureRandom secureRandom = new SecureRandom();
            byte[] keyBytes = new byte[32];
            secureRandom.nextBytes(keyBytes);
            return Base64.getEncoder().encodeToString(keyBytes);
        }

        public static void main(String[] args) {
            System.out.println("JWT Key: " + generateKey());
        }
}
