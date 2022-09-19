DROP PROCEDURE IF EXISTS newsletter_by_spr;
DELIMITER //
CREATE PROCEDURE newsletter_by_spr(
  StartDay DATETIME,
  EndDay DATETIME
)
BEGIN
  SELECT
    COUNT(contact.name),
    newsletter.newsletter,
    newsletter.date_creation
  FROM arnion.newsletter
RIGHT JOIN
  (contact
    RIGHT JOIN contact_newsletter_links_copy ON contact.id_contact = contact_newsletter_links_copy.id_contact
  )
  ON newsletter.id_newsletter = contact_newsletter_links_copy.id_newsletter
  WHERE newsletter.date_creation BETWEEN StartDay AND EndDay
  GROUP BY newsletter.newsletter;
END
//
DELIMITER ;