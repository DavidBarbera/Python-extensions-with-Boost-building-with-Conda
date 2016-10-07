
PYTHON_ADD_MODULE(hellou hello.cpp)
FILE(COPY hello.py DESTINATION .)
ADD_TEST(01-HelloWorld hello.py)

execute_process(COMMAND "python" -c "from distutils.sysconfig import get_python_lib; print(get_python_lib(True))" OUTPUT_VARIABLE PYTHON_SITE_PACKAGES OUTPUT_STRIP_TRAILING_WHITESPACE)


#install

install(TARGETS hellou
    RUNTIME DESTINATION ${PYTHON_SITE_PACKAGES}
    LIBRARY DESTINATION ${PYTHON_SITE_PACKAGES}
)
