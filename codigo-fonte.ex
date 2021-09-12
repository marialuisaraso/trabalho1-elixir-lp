defmodule Todolist do

  def hello do
    :world
  end

  def hello(nome) do
    "Hello " <> nome
  end

#soma
  def sum(a, b) do
    a + b
  end

#subtracao
  def sub(a, b) do
    a-b
  end

#divisao
  def div(a, b) do
    a/b
  end

#multiplicacao
  def mul(a, b) do
    a*b
  end
end

IO.puts("Compilado com sucesso ")

#booleano, comparacao de condicoes para verificar se o numero e igual a 0, pela funcao "zero?"
defmodule Math do
  def zero?(0), do: true
  def zero?(x) when is_integer(x), do: false
end

#fatorial recursivo, que chama a funcao "of" recursivamente, caso o numero n seja diferente de 0 (cujo fatorial e 1)
defmodule Factorial do
	def of(0), do: 1
	def of(n) when n > 0, do: n * of(n - 1)
end

#retornando o tamanho de um vetor, contando o numero de itens (se estiver vazio, retorna 0)
defmodule Length do
  def of([]), do: 0
  def of([_ | tail]), do: 1 + of(tail)
end

#tamanho de uam string (numero de graphemes que ela tem - neste exemplo, retorna 5)
String.length "Hello"

#substituicao em strings (passando a string, o caracter a ser trocado, e o caracter que vai ser incluso - neste caso, retorna "Hallo")
String.replace("Hello", "e", "a")

#duplicacao de strings (passando a string e o numero de vezes que ela deve ser repetida - neste caso, retorna "Oh my Oh my Oh my") 
String.duplicate("Oh my ", 3)

#divisao de strings (passa a string, e divide ela ao meio - retornando neste caso "Hello" e "World")
String.split("Hello World", " ")

#encontrando o tempo atual (neste caso, retorna um numero com horas, minutos, segundos e milissegundos)
Time.utc_now

#encontrando a data atual (neste caso, retorna um numero com ano, mes e dia)
Date.utc_today

#encontrando data e hora atuais, juntos (neste caso, retorna um numero com ano, mes e dia, horas, minutos, segundos e milissegundos)
NaiveDateTime.utc_now

#conferindo se uma string e valida, usando if e else
if String.valid?("Hello") do
  "Valid string!"
else
  "Invalid string."
end

#usando unless para verificar se a string "Hello"e um inteiro - trabalha de forma parecida com o if, mas usando o negativo
unless is_integer("hello") do
  "Not an Int"
end

#usando a estrutura case, para combinar multiplos padroes (a variavel "_" evita erros em caso de falha de combinacao - seria um else que iguala com todo o resto)
case {:ok, "Hello World"} do
  {:ok, result} -> result
  {:error} -> "erro"
  _ -> "Todo o resto"
end

#usando a estrutura cond, usada quando necessitamos associar condições, e não valores
cond do
  2 + 2 == 5 ->
    "isso nao vai ser verdadeiro"
  2 * 2 == 3 ->
    "isso tambem nao vai ser verdadeiro"
  1 + 1 == 2 ->
    "isso e verdadeiro"
end

#utilizando a estrutura enum.all? (nesse caso, a coleção inteira deve ser avaliada como true, caso contrário false será retornado - como no exemplo abaixo)
Enum.all?(["foo", "bar", "hello"], fn(s) -> String.length(s) == 3 end)

#utilizando a estrutura enum.any? (nesse caso, se ao menos um elemento for avaliada como true, true será retornado - como no exemplo abaixo)
Enum.any?(["foo", "bar", "hello"], fn(s) -> String.length(s) == 5 end)

#utilizando a estrutura enum.min, que retorna o menor valor de uma colecao (no exemplo, o -1)
Enum.min([5, 3, 0, -1])

#utilizando a estrutura enum.max, que retorna o maior valor de uma colecao (no exemplo, o 5)
Enum.max([5, 3, 0, -1])

#utilizando enum.sort, que ordena um conjunto de valores (neste caso, a saida sera: -1, 1, 3, 4, 5, 6)
Enum.sort([5, 6, 1, 3, -1, 4])

#operador match (=): comparável ao sinal de igualdade da matemática. Quando usado, a expressão inteira se torna uma equação e faz com que Elixir combine os valores do lado esquerdo com os valores do lado direito da expressão (no exemplo, a saida vai ser 1).
x = 1

#usando sigils:  ~c e ~C sigils geram listas de caracteres respectivamente.
~c/2 + 7 = #{2 + 7}/
#no exemplo acima, a saida vai ser 2 + 7 = 9

~C/2 + 7 = #{2 + 7}/
#no exemplo acima, a saida vai ser 2 + 7 = \#{2 + 7}

#usando sigils:  ~s e ~S sigils usados para gerar dados de String. 
~s/welcome to elixir #{String.downcase "SCHOOL"}/
#no exemplo acima, a saida vai ser welcome to elixir school

~S/welcome to elixir #{String.downcase "SCHOOL"}/
#no exemplo acima, a saida vai ser welcome to elixir \#{String.downcase \"SCHOOL\"}

#criando um sigil customizado: este novo sigil converte uma cadeia para letras maiúsculas.
defmodule MySigils do
  def sigil_u(string, []), do: String.upcase(string)
end
#ou seja, o codigo abaixo retorna ELIXIR SCHOOL
~u/elixir school/

