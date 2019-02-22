CREATE USER 'sandbox'@'%' IDENTIFIED BY 'sandbox';
GRANT ALL PRIVILEGES ON *.* TO 'sandbox'@'%'  WITH GRANT OPTION;
SET global max_length_for_sort_data=1024*1024*8;
