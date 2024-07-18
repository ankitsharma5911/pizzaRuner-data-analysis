USE pizza_runner;

DROP TABLE IF EXISTS runners;

CREATE TABLE
    runners (
        runner_id INT,
        registration_date DATETIME
    );

INSERT INTO
    runners (runner_id, registration_date)
VALUES (1, '2021-01-01'), (2, '2021-01-03'), (3, '2021-01-08'), (4, '2021-01-15');

DROP TABLE IF EXISTS customer_orders;

CREATE TABLE
    customer_orders (
        order_id INTEGER,
        customer_id INTEGER,
        pizza_id INTEGER,
        exclusions VARCHAR(4),
        extras VARCHAR(4),
        order_time TIMESTAMP
    );

INSERT INTO
    customer_orders (
        order_id,
        customer_id,
        pizza_id,
        exclusions,
        extras,
        order_time
    )
VALUES (
        '1',
        '101',
        '1',
        'n',
        'n',
        '2020-01-01 18:05:02'
    ), (
        '2',
        '101',
        '1',
        'n',
        'n',
        '2020-01-01 19:00:52'
    ), (
        '3',
        '102',
        '1',
        'n',
        'n',
        '2020-01-02 23:51:23'
    ), (
        '3',
        '102',
        '2',
        'n',
        'n',
        '2020-01-02 23:51:23'
    ), (
        '4',
        '103',
        '1',
        '4',
        'n',
        '2020-01-04 13:23:46'
    ), (
        '4',
        '103',
        '1',
        '4',
        'n',
        '2020-01-04 13:23:46'
    ), (
        '4',
        '103',
        '2',
        '4',
        'n',
        '2020-01-04 13:23:46'
    ), (
        '5',
        '104',
        '1',
        'n',
        '1',
        '2020-01-08 21:00:29'
    ), (
        '6',
        '101',
        '2',
        'n',
        'n',
        '2020-01-08 21:03:13'
    ), (
        '7',
        '105',
        '2',
        'n',
        '1',
        '2020-01-08 21:20:29'
    ), (
        '8',
        '102',
        '1',
        'n',
        'n',
        '2020-01-09 23:54:33'
    ), (
        '9',
        '103',
        '1',
        '4',
        '1, 5',
        '2020-01-10 11:22:59'
    ), (
        '10',
        '104',
        '1',
        'n',
        'n',
        '2020-01-11 18:34:49'
    ), (
        '10',
        '104',
        '1',
        '2, 6',
        '1, 4',
        '2020-01-11 18:34:49'
    );

DROP TABLE IF EXISTS runner_orders;

CREATE TABLE
    runner_orders (
        order_id INTEGER,
        runner_id INTEGER,
        pickup_time VARCHAR(19),
        distance INT,
        duration INT,
        cancellation VARCHAR(23)
    );

INSERT INTO
    runner_orders (
        order_id,
        runner_id,
        pickup_time,
        distance,
        duration,
        cancellation
    )
VALUES (
        '1',
        '1',
        '2020-01-01 18:15:34',
        '20',
        '32 ',
        'nc'
    ), (
        '2',
        '1',
        '2020-01-01 19:10:54',
        '20',
        '27',
        'nc'
    ), (
        '3',
        '1',
        '2020-01-03 00:12:37',
        '13.4',
        '20',
        'nc'
    ), (
        '4',
        '2',
        '2020-01-04 13:53:03',
        '23.4',
        '40',
        'nc'
    ), (
        '5',
        '3',
        '2020-01-08 21:10:57',
        '10',
        '15',
        'nc'
    ), (
        '6',
        '3',
        '0',
        '0',
        '0',
        'Restaurant Cancellation'
    ), (
        '7',
        '2',
        '2020-01-08 21:30:45',
        25,
        25,
        'nc'
    ), (
        '8',
        '2',
        '2020-01-10 00:15:02',
        23.4,
        0,
        'nc'
    ), (
        '9',
        '2',
        0,
        0,
        0,
        'Customer Cancellation'
    ), (
        '10',
        '1',
        '2020-01-11 18:50:20',
        10,
        10,
        'nc'
    );

DROP TABLE IF EXISTS pizza_names;

CREATE TABLE
    pizza_names (
        pizza_id INTEGER,
        pizza_name TEXT
    );

INSERT INTO
    pizza_names (pizza_id, pizza_name)
VALUES (1, 'Meatlovers'), (2, 'Vegetarian');

DROP TABLE IF EXISTS pizza_recipes;

CREATE TABLE pizza_recipes (pizza_id INTEGER, toppings TEXT);

INSERT INTO
    pizza_recipes (pizza_id, toppings)
VALUES (1, '1, 2, 3, 4, 5, 6, 8, 10'), (2, '4, 6, 7, 9, 11, 12');

DROP TABLE IF EXISTS pizza_toppings;

CREATE TABLE
    pizza_toppings (
        topping_id INTEGER,
        topping_name TEXT
    );

INSERT INTO
    pizza_toppings (topping_id, topping_name)
VALUES (1, 'Bacon'), (2, 'BBQ Sauce'), (3, 'Beef'), (4, 'Cheese'), (5, 'Chicken'), (6, 'Mushrooms'), (7, 'Onions'), (8, 'Pepperoni'), (9, 'Peppers'), (10, 'Salami'), (11, 'Tomatoes'), (12, 'Tomato Sauce');

SELECT * FROM pizza_runner.customer_orders;

SELECT * FROM pizza_runner.pizza_names;

SELECT * FROM pizza_runner.pizza_recipes;

SELECT * FROM pizza_runner.pizza_toppings;

SELECT * FROM pizza_runner.runner_orders;

SELECT * FROM pizza_runner.runners;

/*
 
 -- A. Pizza Metrics
 
 1. How many pizzas were ordered?
 2. How many unique customer orders were made?
 3.How many successful orders were delivered by each runner?
 4.How many of each type of pizza was delivered?
 5. How many Vegetarian and Meatlovers were ordered by each customer?
 6. What was the maximum number of pizzas delivered in a single order?
 7. For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
 8. How many pizzas were delivered that had both exclusions and extras?
 9. What was the total volume of pizzas ordered for each hour of the day?
 10. What was the volume of orders for each day of the week?
 */

--  1. How many pizzas were ordered?

select COUNT(pizza_id) FROM customer_orders;

--  2. How many unique customer orders were made?

SELECT COUNT(DISTINCT customer_id) FROM customer_orders;

--  3.How many successful orders were delivered by each runner?

SELECT
    runner_id,
    COUNT(order_id)
from
    runner_orders -- WHERE  cancellation NOT IN ("Customer Cancellation","Restaurant Cancellation") 
WHERE pickup_time IS NOT NULL
GROUP BY runner_id;

--  4.How many of each type of pizza was delivered?

SELECT
    c.pizza_id,
    p.pizza_name,
    COUNT(c.pizza_id)
FROM
    pizza_runner.customer_orders c
    JOIN runner_orders r on c.order_id = r.order_id
    JOIN pizza_names p ON c.pizza_id = p.pizza_id
WHERE
    cancellation NOT IN (
        "Customer Cancellation",
        "Restaurant Cancellation"
    )
GROUP BY pizza_id, pizza_name;

--  5. How many Vegetarian and Meatlovers were ordered by each customer?

SELECT
    c.pizza_id,
    p.pizza_name,
    COUNT(c.pizza_id)
FROM
    pizza_runner.customer_orders c
    JOIN runner_orders r on c.order_id = r.order_id
    JOIN pizza_names p ON c.pizza_id = p.pizza_id
WHERE
    cancellation NOT IN (
        "Customer Cancellation",
        "Restaurant Cancellation"
    )
GROUP BY pizza_id, pizza_name;

--  6. What was the maximum number of pizzas delivered in a single order?
SELECT
    c.order_id,
    COUNT(c.order_id) as total_order
FROM customer_orders c
    JOIN runner_orders r on c.order_id = r.order_id
WHERE
    cancellation NOT IN (
        "Customer Cancellation",
        "Restaurant Cancellation"
    )
GROUP BY order_id
ORDER BY total_order DESC
LIMIT 1;


-- 7. For each customer, how many delivered pizzas had at least 1 change and how many had no changes?

SELECT
    DISTINCT customer_id,
    exclusions
FROM customer_orders
WHERE exclusions = 'n';

SELECT
    DISTINCT customer_id,
    extras
FROM customer_orders
WHERE exclusions <> 'n';

-- 8. How many pizzas were delivered that had both exclusions and extras?

SELECT COUNT(pizza_id)
FROM customer_orders
WHERE
    exclusions <> 'n'
    and extras <> 'n';

-- 9. What was the total volume of pizzas ordered for each hour of the day?

SELECT
    HOUR(order_time) HOUR,
    COUNT(pizza_id) as ordersPerHours
FROM customer_orders
GROUP BY HOUR
ORDER BY HOUR;

-- What was the volume of orders for each day of the week?

SELECT
    DAYNAME(order_time) DAY,
    COUNT(pizza_id) as ordersPerDay
FROM customer_orders
GROUP BY DAY;



-- B. Runner and Customer Experience

-- 1.How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)

SELECT
    WEEK(REGISTRATION_date) WEEK,
    COUNT(runner_id) AS NoOfRunners
FROM runners
GROUP BY WEEK;

-- 2.What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?

SELECT a.runner_id, AVG(AVG)
from (
        SELECT
            r.runner_id,
            CASE
                WHEN pickup_time <> 0 THEN MINUTE(c.order_time)
                ELSE 0
            END as MINUTE,
            MINUTE(pickup_time) as pickuptime,
            AVG(
                ABS(
                    CAST( (
                            MINUTE(pickup_time) - CASE
                                WHEN pickup_time <> 0 THEN MINUTE(c.order_time)
                                ELSE 0
                            END
                        ) AS SIGNED
                    )
                )
            ) as AVG
        FROM customer_orders c
            INNER JOIN runner_orders r on c.order_id = r.order_id
            WHERE pickup_time <> 0
        GROUP BY
            r.runner_id,
            MINUTE,
            pickuptime
    ) a
GROUP BY runner_id;

-- 3.Is there any relationship between the number of pizzas and how long the order takes to prepare?


-- 4.What was the average distance travelled for each customer?

SELECT
    runner_id,
    AVG(distance) AvgDistance
FROM runner_orders
GROUP BY runner_id;

-- 5.What was the difference between the longest and shortest delivery times for all orders?



-- 6.What was the average speed for each runner for each delivery and do you notice any trend for these values?


SELECT runner_id , avg(distance/duration) FROM runner_orders
GROUP BY runner_id;            -- speed = dist / time  (km/MIN)


-- 7.What is the successful delivery percentage for each runner?

SELECT runner_id ,pickup_time FROM runner_orders;

--  C. Ingredient Optimisation

--  1.What are the standard ingredients for each pizza?

SELECT * FROM
--  2.What was the most commonly added extra?

--  3.What was the most common exclusion?

--  4.Generate an order item for each record in the customers_orders table in the format of one of the following:

--  Meat Lovers

--  Meat Lovers - Exclude Beef

--  Meat Lovers - Extra Bacon

--  Meat Lovers - Exclude Cheese, Bacon - Extra Mushroom, Peppers

--  5.Generate an alphabetically ordered comma separated ingredient list for each pizza order from the customer_orders table and add a 2x in front of any relevant ingredients

--  For example: "Meat Lovers: 2xBacon, Beef, ... , Salami"

--  6.What is the total quantity of each ingredient used in all delivered pizzas sorted by most frequent first?

--  D. Pricing and Ratings

--  If a Meat Lovers pizza costs $12 and Vegetarian costs $10 and there were no charges for changes - how much money has Pizza Runner made so far if there are no delivery fees?

--  What if there was an additional $1 charge for any pizza extras?

--  Add cheese is $1 extra

--  The Pizza Runner team now wants to add an additional ratings system that allows customers to rate their runner, how would you design an additional table for this new dataset - generate a schema for this new table and insert your own data for ratings for each successful customer order between 1 to 5.

--  Using your newly generated table - can you join all of the information together to form a table which has the following information for successful deliveries?

--  customer_id

--  order_id

--  runner_id

--  rating

--  order_time

--  pickup_time

--  Time between order and pickup

--  Delivery duration

--  Average speed

--  Total number of pizzas

--  If a Meat Lovers pizza was $12 and Vegetarian $10 fixed prices with no cost for extras and each runner is paid $0.30 per kilometre traveled - how much money does Pizza Runner have left over after these deliveries?

--  E. Bonus Questions

--  If Danny wants to expand his range of pizzas - how would this impact the existing data design? Write an INSERT statement to demonstrate what would happen if a new Supreme pizza with all the toppings was added to the Pizza Runner menu

