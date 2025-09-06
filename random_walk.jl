# This julia program simulates a random walk in Z^2

using Random
using Plots

# define a type Walker and a constructor for Walker
mutable struct Walker
    x::Int
    y::Int
    path_x::Vector{Int}
    path_y::Vector{Int}
end
# constructor for Walker
function Walker(x::Int, y::Int, max_distance::Int)
    Walker(x, y, zeros(Int, max_distance), zeros(Int, max_distance))
end

function move!(walker::Walker, step_index::Int)
    direction = rand([0, 1])
    step = rand([-1, 1])
    if direction == 0
        walker.x += step
    else
        walker.y += step
    end

    walker.path_x[step_index] = walker.x
    walker.path_y[step_index] = walker.y
end

function random_walk(x::Int, y::Int, max_distance)
    #declaring walker
    walker = Walker(x, y, max_distance)
    for step_index in 2:max_distance
        move!(walker, step_index)
    end
    return walker
end

@time begin
    # The number of steps for the random walk.
    num_steps = 10000

    # Perform the random walk.
    final_walker = random_walk(0, 0, num_steps)

    # Create a plot using the path data stored in the Walker object.
    p = plot(
        final_walker.path_x,
        final_walker.path_y,
        title="Simulação de Passeio Aleatório",
        xlabel="Posição X",
        ylabel="Posição Y",
        label="Caminho",
        legend=:topright,
        size=(1920, 1440)
    )

    # Save the plot to a file.
    savefig(p, "plot.png")
end
