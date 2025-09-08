
{% macro season_function(x)%}
CASE
WHEN MONTH(TO_TIMESTAMP({{x}})) IN (12,1,2) THEN 'Winter'
WHEN MONTH(TO_TIMESTAMP({{x}})) IN (3,4,5) THEN 'Spring'
WHEN MONTH(TO_TIMESTAMP({{x}})) IN (6,7,8) THEN 'Summer'
WHEN MONTH(TO_TIMESTAMP({{x}})) IN (9,10,11) THEN 'Fall'
ELSE ''
END
{% endmacro%}

 {% macro day_type(x) %}
CASE 
WHEN DAYNAME(TO_TIMESTAMP({{x}})) IN ('Sat','Sun') 
THEN 'Weekend'
ELSE 'BussinessDay'
END 

 {% endmacro %}