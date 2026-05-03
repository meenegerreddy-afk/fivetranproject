{{ config(materialized='view') }}

SELECT 
    l.name AS label_name, 
    COUNT(ml.message_id) AS message_count
FROM {{ source('fivetran', 'MESSAGE_LABEL') }} ml
JOIN {{ source('fivetran', 'LABEL') }} l ON ml.label_id = l.id
GROUP BY l.name
ORDER BY message_count DESC
LIMIT 5
