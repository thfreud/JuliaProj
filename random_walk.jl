# This julia program simulates a random walk in Z^2

using Random
using Plots
max_distance::Int = 50000
path_x = zeros(Int,max_distance)
path_y = zeros(Int, max_distance)

mutable struct Walker
    x::Int
    y::Int
    function Walker(a::Int, b::Int)
        new(a,b)
    end    
end

function move!(walker::Walker, direction)
step = rand([-1,1])
    if direction==0
        walker.x += step
    else
        walker.y += step
    end
end

@time function path!(walker::Walker, path_x, path_y, max_distance)
    path_x[1] = walker.x
    path_y[1] = walker.y
    for i in 2:max_distance
        move!(walker, rand(0:1))
        path_x[i] = walker.x
        path_y[i] = walker.y
    end
end

walker = Walker(0,0)
path!(walker, path_x, path_y, max_distance)

plot(
    path_x, 
    path_y, 
    title="Simulação de Passeio Aleatório", 
    xlabel="Posição X", 
    ylabel="Posição Y", 
    label="Caminho", 
    legend=:topright,
    size=(800, 800)
)
