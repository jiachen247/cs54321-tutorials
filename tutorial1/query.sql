-- Question 1a
SELECT c.first_name, c.last_name
FROM customers c
LEFT JOIN cards card
ON c.id = card.customer_id
WHERE (card.card_type = 'visa' OR card.card_type = 'jcb') AND c.country = 'United States'
GROUP BY c.id;

-- Question 1b
SELECT c.id, COUNT(card.id)
FROM customers c
LEFT JOIN cards card
ON card.customer_id = c.id
GROUP BY c.id;

-- Question 1c / d
SELECT trans.id, trans.amount
FROM transactions trans, cards card,
     (
        SELECT c.card_type, MAX(t.amount) as card_max
        FROM transactions t, cards c
        WHERE t.card_id = c.id
        GROUP BY c.card_type
     ) as sub
WHERE trans.card_id = card.id AND card.card_type = sub.card_type AND trans.amount = sub.card_max
GROUP BY trans.id;

