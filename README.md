# FiniteDifferenceCoeffs
Finite difference coefficients of any order for any number of derivatives in any precision.


Got tired of doing this over and over again. This uses SymPy.jl to compute the coefficients
symbolically via differentiating Lagrange polynomials at equally spaced nodes, the result
can be downcast to any precision - even arbitrary precision.



Example usage


```julia
include("fd.jl");
#Use forth-order approximation
order=4
#Compute second order derivative coefficients, downcast to Float64
D=fd(order+1,2,t=Float64); 
#D[:,order/2] is central difference formula
#D[:,1] is one-sided difference formula
#etc..
```
