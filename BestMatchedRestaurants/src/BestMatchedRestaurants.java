import java.util.ArrayList;
import java.util.Hashtable;

import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.DriverManager;

public class BestMatchedRestaurants {

    public static void main(String[] args) {
        Hashtable<String, String> parameters = processParameters(args);

        // Attempt to connect to sql
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList<Restaurant> restaurantDs = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (Exception ex) {
            throw new RuntimeException(ex.getMessage());
        }

        try {
            conn =
                    DriverManager.getConnection("jdbc:mysql://localhost:3306/bestmatchedrestuarantsschema?" +
                            "user=root&password=password");

            stmt = conn.createStatement();
            rs = stmt.executeQuery(buildQuery(parameters));

            while(rs.next()) {
                String name = rs.getString("name");
                int customerRating = rs.getInt("customer_rating");
                int distance = rs.getInt("distance");
                int price = rs.getInt("price");
                String cuisine_name = rs.getString("cuisine_name");

                // Create a new restaurant model based on results and add to list
                Restaurant rest = new Restaurant(name, customerRating, distance, price, cuisine_name);
                restaurantDs.add(rest);
            }

            // Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (SQLException ex) {
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }

        mergeSort(restaurantDs);

        // Determine best match results
        printResults(restaurantDs);
    }

    /**
     * Stores program arguments passed in by the user to a HashTable. Checks that there is at least 1 argument and
     * that all are formatted correctly (E.g argumentName=argumentValue). Also ensures that "price", "distance" and "rating"
     * are all integers.
     *
     * @param  args     array of program arguments passed in by user
     * @return          HashTable of String keys to String values with validated program arguments
     */
    public static Hashtable<String, String> processParameters(String[] args) {
        Hashtable<String, String> table = new Hashtable<>();

        // Check that at least 1 parameter is passed in
        if(args.length < 1) {
            throw new IllegalArgumentException("Please enter at least 1 search parameter.");
        }
        for(String arg: args) {
            StringBuilder argName = new StringBuilder();
            String[] splitArg = arg.split("=");

            if(splitArg.length > 2) {
                throw new IllegalArgumentException("Please format program argument like argument=value. " +
                        "(Eg. distance=5)");
            }

            switch (splitArg[0].toLowerCase()) {
                case "price": case "distance": case "rating":
                    // Check if value is integer
                    try {
                        Integer.parseInt(splitArg[1]);
                        table.put(splitArg[0], splitArg[1]);
                    }
                    catch (NumberFormatException ex) {
                        throw new NumberFormatException("Parameter " + splitArg[0] + " should be an integer");
                    }
                    break;
                case "name": case "cuisine":
                    table.put(splitArg[0], splitArg[1]);
                    break;
                default:
                    throw new IllegalArgumentException("Illegal parameter name: " + splitArg[0]);
            }
        }

        return table;
    }

    /**
     * Builds up select query to execute against db. Will only append where clauses if that corresponding argument
     * was passed in to program.
     *
     * @param  table    HashTable with all program arguments
     * @return          String containing SQL query to execute
     */
    public static String buildQuery(Hashtable<String, String> table) {
        int paramCounter = table.size();

        String query = "SELECT restaurants.name, restaurants.customer_rating, restaurants.distance, restaurants.price, cuisines.name as cuisine_name from restaurants " +
                "inner join cuisines on restaurants.cuisine_id = cuisines.id WHERE ";

            if (table.containsKey("name")) {
                if (paramCounter > 1)
                    query += "LOWER(restaurants.name) like LOWER('" + table.get("name") + "%') AND ";
                else query += "LOWER(restaurants.name) like LOWER('" + table.get("name") + "%')";
                paramCounter--;
            }

            if (table.containsKey("cuisine")) {
                if(paramCounter > 1) query += "LOWER(cuisines.name) like LOWER('" + table.get("cuisine") + "%') AND ";
                else query += "LOWER(cuisines.name) like LOWER('" + table.get("cuisine") + "%')";
                paramCounter--;
            }

            if(table.containsKey("rating")) {
                if(paramCounter > 1) query += "restaurants.customer_rating >= " + table.get("rating") + " AND ";
                else query += "restaurants.customer_rating >= " + table.get("rating");
                paramCounter--;
            }

            if(table.containsKey("distance")) {
                if(paramCounter > 1) query += "restaurants.distance <= " + table.get("distance") + " AND ";
                else query += "restaurants.distance <= " + table.get("distance");
            }

            if(table.containsKey("price")) {
                query += "restaurants.price <= " + table.get("price");
            }

        return query;
    }

    /**
     * Base function to do merge sort.
     *
     * @param  restaurants  ArrayList containing list of Restaurants to sort
     * @return              nothing. Original list is now sorted
     */
    public static void mergeSort(ArrayList<Restaurant> restaurants) {
        Restaurant[] helper = new Restaurant[restaurants.size()];
        mergeSort(restaurants, helper, 0, restaurants.size() - 1);
    }

    /**
     * Helper function to do merge sort. Recursively sorts then merges halves of the ArrayList
     *
     * @param  restaurants  ArrayList containing list of Restaurants to sort
     * @param  helper       Temporary buffer to hold elements before merge
     * @param  low          Lower boundary of array after split
     * @param  high         Higher boundary of array after split
     * @return              nothing
     */
    public static void mergeSort(ArrayList<Restaurant> restaurants, Restaurant[] helper, int low, int high) {
        if(low < high) {
            int middle = (low + high) / 2;
            mergeSort(restaurants, helper, low, middle);
            mergeSort(restaurants, helper, middle + 1, high);
            merge(restaurants, helper, low, middle, high);
        }
    }

    /**
     * Merge logic of mergeSort. Copies all data to temporary buffer then returns them back to original ArrayList in
     * correct order. Restaurants are first ordered by distance, if distances between two Restaurants are the same,
     * the one with the higher customer rating goes first. If ratings are also the same, the one with the lowest
     * average price per person goes first. If they're STILL the same, the rightmost of the two in the buffer goes first.
     *
     * @param  restaurants  ArrayList containing list of Restaurants to sort
     * @param  helper       Temporary buffer to hold elements before merge
     * @param  low          Lower boundary of array after split
     * @param  middle       Middle index that splits buffer into two halves for comparison
     * @param  high         Higher boundary of array after split
     * @return              nothing. Original list is now sorted
     */
    public static void merge(ArrayList<Restaurant> restaurants, Restaurant[] helper, int low, int middle, int high) {
        for(int i = low; i <= high; i++) {
            helper[i] = restaurants.get(i);
        }

        int helperLeft = low;
        int helperRight = middle + 1;
        int current = low;

        while(helperLeft <= middle && helperRight <= high) {
            if(helper[helperLeft].getDistance() < helper[helperRight].getDistance()) {
                restaurants.set(current, helper[helperLeft]);
                helperLeft++;
            }
            else if(helper[helperLeft].getDistance() > helper[helperRight].getDistance()) {
                restaurants.set(current, helper[helperRight]);
                helperRight++;
            }
            else {
                if(helper[helperLeft].getRating() < helper[helperRight].getRating()) {
                    restaurants.set(current, helper[helperRight]);
                    helperRight++;
                }
                else if(helper[helperLeft].getRating() > helper[helperRight].getRating()) {
                    restaurants.set(current, helper[helperLeft]);
                    helperLeft++;
                }
                else { // Distances AND ratings equal, check price
                    if(helper[helperLeft].getPrice() < helper[helperRight].getPrice()) {
                        restaurants.set(current, helper[helperLeft]);
                        helperLeft++;
                    }
                    else {
                        restaurants.set(current, helper[helperRight]);
                        helperRight++;
                    }
                }

            }
            current++;
        }

        // Copy rest of left side
        int remaining = middle - helperLeft;
        for(int i = 0; i<= remaining; i++) {
            restaurants.set(current + i, helper[helperLeft + i]);
        }
    }

    /**
     * Prints out best matching results. If more than 5 results, only print out the best 5. If less than 5 results,
     * print them all out.
     *
     * @param  restaurants  ArrayList containing list of Restaurants to print
     * @return              nothing
     */
    public static void printResults(ArrayList<Restaurant> restaurants) {
        System.out.println("Printing out best matches:");
        String format = "|%1$-25s|%2$-8s|%3$-15s|%4$-5s|%5$-15s|";
        System.out.format(format, "Name", "Distance", "Customer rating", "Price", "Cuisine");
        System.out.println();
        System.out.println("--------------------------------------------------------------------------");
        int printCount = 0;
        printCount = restaurants.size() > 5 ? 5 : restaurants.size();

        for(int i = 0; i < printCount; i++) {
            Restaurant rest = restaurants.get(i);
            System.out.format(format, rest.getName(), rest.getDistance(), rest.getRating(), rest.getPrice(), rest.getCuisine());
            System.out.println();
        }

    }
}
