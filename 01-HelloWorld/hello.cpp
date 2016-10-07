char const* greet()
{
   return "hello, there, welcome to C++";
}

#include <boost/python.hpp>

BOOST_PYTHON_MODULE(hellou)
{
    using namespace boost::python;
    def("greet", greet);
}
