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