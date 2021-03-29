USE CLASSICMODELS;
SELECT 
    PRODUCTCODE, PRODUCTNAME, BUYPRICE, QUANTITYINSTOCK
FROM
    PRODUCTS
WHERE
    BUYPRICE > 56.76
        AND QUANTITYINSTOCK > 10;

SELECT 
    PRODUCTCODE, PRODUCTNAME, BUYPRICE, QUANTITYINSTOCK
FROM
    PRODUCTS
        INNER JOIN
    PRODUCTLINES ON PRODUCTS.PRODUCTLINE = PRODUCTLINES.PRODUCTLINE
WHERE
    BUYPRICE > 56.76 AND BUYPRICE < 95.59;

SELECT 
    PRODUCTCODE,
    PRODUCTNAME,
    BUYPRICE,
    QUANTITYINSTOCK,
    PRODUCTVENDOR,
    PRODUCTLINE
FROM
    PRODUCTS
WHERE
    PRODUCTLINE = 'CLASSIC CARS'
        OR PRODUCTVENDOR = 'MIN LIN DIECAST';