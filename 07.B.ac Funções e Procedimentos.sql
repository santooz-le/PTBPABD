/* Questão 01*/

CREATE OR ALTER PROCEDURE dbo.salaryHistogram
    @qtdIntervalos INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @menorSalario INT;
    DECLARE @maiorSalario INT;
    DECLARE @tamanhoIntervalo INT;

    /* Descobre o menor e o maior salário */
    SELECT
        @menorSalario = MIN(salario),
        @maiorSalario = MAX(salario)
    FROM dbo.Professores;

    /* Calcula o tamanho de cada intervalo */
    SET @tamanhoIntervalo = CEILING(
        (@maiorSalario - @menorSalario + 1.0) / @qtdIntervalos
    );

    /* Gera os intervalos e conta os salários em cada faixa */
    ;WITH numeros AS
    (
        SELECT 1 AS n

        UNION ALL

        SELECT n + 1
        FROM numeros
        WHERE n < @qtdIntervalos
    ),
    intervalos AS
    (
        SELECT
            @menorSalario + ((n - 1) * @tamanhoIntervalo) AS valorMinimo,
            CASE
                WHEN n = @qtdIntervalos THEN @maiorSalario
                ELSE @menorSalario + (n * @tamanhoIntervalo) - 1
            END AS valorMaximo
        FROM numeros
    )
    SELECT
        i.valorMinimo,
        i.valorMaximo,
        COUNT(p.salario) AS total
    FROM intervalos i
    LEFT JOIN dbo.Professores p
        ON p.salario BETWEEN i.valorMinimo AND i.valorMaximo
    GROUP BY
        i.valorMinimo,
        i.valorMaximo
    ORDER BY
        i.valorMinimo;
END;

/* Executa a procedure com 5 intervalos */
EXEC dbo.salaryHistogram 5;
