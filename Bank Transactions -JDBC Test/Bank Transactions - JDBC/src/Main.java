import java.sql.*;

public class Main {

    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/bank-transactions";
        String username = "username";
        String pass = "password";

        try (Connection con = DriverManager.getConnection(url, username, pass);
             Statement stmt = con.createStatement()) {

            System.out.println("Connection to database successful.");

            String totalTransactionsQuery = "SELECT COUNT(*) AS total_transactions " +
                                            "FROM TRANSACTIONS WHERE A_ID = 49";
            ResultSet result1 = stmt.executeQuery(totalTransactionsQuery);
            if (result1.next()) {
                System.out.println("Total transactions for account 49: " + result1.getInt("total_transactions"));
            }


            String totalCreditsQuery = "SELECT COUNT(*) AS total_credits FROM TRANSACTIONS WHERE TYPE = '0'";
            ResultSet result2 = stmt.executeQuery(totalCreditsQuery);
            if (result2.next()) {
                System.out.println("Total credit transactions: " + result2.getInt("total_credits"));
            }


            String last6MonthsQuery = "SELECT * FROM TRANSACTIONS " +
                                      "WHERE DTM BETWEEN '2021-07-01' AND '2021-12-31'";
            ResultSet result3 = stmt.executeQuery(last6MonthsQuery);
            System.out.println("Transactions from the last 6 months of 2021:");
            while (result3.next()) {
                System.out.println("T_ID: " + result3.getInt("T_ID") +
                        ", A_ID: " + result3.getInt("A_ID") +
                        ", Amount: " + result3.getDouble("AMOUNT") +
                        ", Type: " + (result3.getString("TYPE").equals("0") ? "Credit" : "Debit") +
                        ", Date: " + result3.getTimestamp("DTM"));
            }


            String categoryQuery = """
                    SELECT A.A_ID, 
                           SUM(CASE WHEN T.TYPE = '0' THEN T.AMOUNT ELSE -T.AMOUNT END) AS balance,
                           SUM(T.AMOUNT) AS total_transacted
                    FROM ACCOUNT A
                    LEFT JOIN TRANSACTIONS T ON A.A_ID = T.A_ID
                    GROUP BY A.A_ID
                    """;
            ResultSet result4 = stmt.executeQuery(categoryQuery);

            int cipCount = 0, vipCount = 0, opCount = 0, otherCount = 0;

            while (result4.next()) {
                double balance = result4.getDouble("balance");
                double totalTransacted = result4.getDouble("total_transacted");

                if (balance > 1_000_000 && totalTransacted > 5_000_000) {
                    cipCount++;
                } else if (balance > 500_000 && balance < 900_000 && totalTransacted > 2_500_000 && totalTransacted < 4_500_000) {
                    vipCount++;
                } else if (balance < 100_000 && totalTransacted < 1_000_000) {
                    opCount++;
                } else {
                    otherCount++;
                }
            }

            System.out.println("Number of CIPs: " + cipCount);
            System.out.println("Number of VIPs: " + vipCount);
            System.out.println("Number of OPs: " + opCount);
            System.out.println("Number of people in other categories: " + otherCount);

        } catch (SQLException e) {
            System.out.println("Database error: " + e.getMessage());
        }
    }
}
