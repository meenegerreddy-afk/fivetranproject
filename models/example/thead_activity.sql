SELECT t.id AS thread_id, COUNT(m.id) AS messages_in_thread
FROM {{ source('fivetran', 'THREAD') }} t
JOIN {{ source('fivetran', 'MESSAGE') }} m ON m.thread_id = t.id
GROUP BY t.id
ORDER BY messages_in_thread DESC