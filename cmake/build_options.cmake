if (MSVC)
    set(wae /WX)
    set(warnings /W3 /w14640 /permissive-)
else ()
    set(wae -Werror)
    set(warnings -Wall -Wextra -Wshadow -Wnon-virtual-dtor -Wno-psabi -pedantic)
endif ()
