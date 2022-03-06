UPDATE battles
SET 
name = 
space( datalength(name) - datalength(
                                                      rtrim(name + ' ')
                                                   )
        
)
 + rtrim(name + '   ')
