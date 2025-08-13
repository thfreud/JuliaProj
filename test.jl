import Base
mutable struct Pessoa
    idade
    nome
end


mutable struct Engenheiro
    pessoa::Pessoa
    salario
end

pessoa = Pessoa(40,"Paulo")

pessoa_engenheira = Engenheiro(pessoa, 1500)
println(pessoa_engenheira.pessoa.nome)

function Base.iterate(pessoa::Pessoa, state = 1)
    if state > fieldcount(typeof(pessoa))
        return nothing
    else
        return (getfield(pessoa, state), state+1)
    end
end

for campo in pessoa
    println(campo)
end




println(fieldnames(Pessoa))

for i in fieldnames(Pessoa)
    valor = getfield(pessoa, i)
    println(valor)
end

#outra maneira 

