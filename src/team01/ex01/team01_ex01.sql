SELECT 
    COALESCE("user".name, 'not defined') AS name,
    COALESCE("user".lastname, 'not defined') AS lastname,
    currency.name AS currency_name,
    balance.money * currency.rate_to_usd AS currency_in_usd
FROM balance
LEFT JOIN "user" ON "user".id = balance.user_id
LEFT JOIN currency ON currency.id = balance.currency_id
    AND currency.updated = COALESCE(
        (
            SELECT MAX(updated)
            FROM currency
            WHERE 
                currency.id = balance.currency_id
                AND 
                currency.updated <= balance.updated
        ),
        (
            SELECT MIN(updated)
            FROM currency
            WHERE 
                currency.id = balance.currency_id
                AND 
                currency.updated > balance.updated
        )
    )
WHERE currency.name IS NOT NULL
ORDER BY name DESC, lastname ASC, currency_name ASC;