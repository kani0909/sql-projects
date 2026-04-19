CREATE OR REPLACE FUNCTION fnc_fibonacci(IN pstop integer DEFAULT 10)
RETURNS TABLE (
    fibonacci_number integer
) AS $$
DECLARE
    a integer := 0;
    b integer := 1;
    temp integer;
BEGIN
   IF a < pstop THEN
        fibonacci_number := a;
        RETURN NEXT;
    END IF;
   
    IF b < pstop THEN
        fibonacci_number := b;
        RETURN NEXT;
    END IF;
    
    WHILE a + b < pstop LOOP
        temp := a + b;
        a := b;
        b := temp;
        fibonacci_number := b;
        RETURN NEXT;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();