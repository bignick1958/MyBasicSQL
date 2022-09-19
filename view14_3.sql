CREATE VIEW vw_goods_n_cats AS
SELECT  vw_goods_categories.Категория AS Категория , COUNT( vw_goods.Наименование ) AS Количество
FROM vw_goods, vw_goods_categories 
WHERE vw_goods.id_categories = vw_goods_categories.id_categories 
GROUP BY vw_goods_categories.Категория;

DROP VIEW vw_goods_n_cats;
CREATE VIEW vw_goods_n_cats AS
  SELECT  vw_goods_categories.Категория AS Категория, COUNT( vw_goods.Наименование ) AS Количество 
    FROM { OJ vw_goods 
      LEFT OUTER JOIN vw_goods_categories ON vw_goods.id_categories = vw_goods_categories.id_categories } 
        GROUP BY vw_goods_categories.Категория;