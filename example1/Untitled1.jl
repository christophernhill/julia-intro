# Setup plotting environment
using Pkg;
Pkg.add("Plots");
using Plots;
Pkg.add("PyPlot");
Pkg.add("PyCall");
Pkg.add("LaTeXStrings");
pyplot();

# Define a Gaussian shaped function
# Note - we put loop inside function so it can operate on Array object and
# so it can execute efficiently. Calling function for each element of Array
# is more expensive. 
ndist(x,μ,σ)=[1/√(2*pi*σ^2)*exp(-((xx-μ)^2)/(2*σ^2)) for xx in x]

# Define a list of values and apply Gaussian function to them, showing timing.
x=collect(-10:0.1:10);
μ=0.;σ=pi;@time yy=ndist(x,μ,σ)
plot(x,yy)

Pkg.add("Statistics")
using Statistics;
print(Statistics.std(yy))

Pkg.add("InteractiveUtils")
using InteractiveUtils;
@code_native ndist(x,μ,σ);
