package com.app.replant;

import java.sql.*;

public class MigrationRunner {
    public static void main(String[] args) {
        String url = "jdbc:mysql://113.198.66.75:13150/replant?useSSL=false&allowPublicKeyRetrieval=true";
        String user = "replant_admin";
        String password = "replant2025";

        String[] sqls = {
            "DROP TABLE IF EXISTS mission_qna_answer",
            "DROP TABLE IF EXISTS mission_qna",
            "DROP TABLE IF EXISTS chat_message",
            "DROP TABLE IF EXISTS chat_room",
            "DROP TABLE IF EXISTS member_card",
            "DROP TABLE IF EXISTS card",
            "DROP TABLE IF EXISTS goal",
            "DROP TABLE IF EXISTS member",
            "DROP TABLE IF EXISTS custom_mission"
        };

        try (Connection conn = DriverManager.getConnection(url, user, password);
             Statement stmt = conn.createStatement()) {

            for (String sql : sqls) {
                System.out.println("Executing: " + sql);
                stmt.execute(sql);
            }

            try {
                stmt.execute("ALTER TABLE user_recommendation DROP COLUMN custom_mission_id");
                System.out.println("Dropped custom_mission_id column");
            } catch (SQLException e) {
                System.out.println("Column might not exist: " + e.getMessage());
            }

            System.out.println("Migration completed successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        }
    }
}