function [entradas,saidasDesejadas] = geraEntradasESaidasDesejadas(nEntradas,qtdPerguntas)
    entradas = zeros(nEntradas,qtdPerguntas);
	for i = 1:nEntradas
       if (i <= nEntradas*33/100)
           entradas(i,:) = randi([0,1],1,qtdPerguntas);
       elseif(i >nEntradas*33/100 )&&(i <= nEntradas*66/100)
           entradas(i,:) = randi([0,2],1,qtdPerguntas);
       elseif(i >nEntradas*66/100 )
           entradas(i,:) = randi([1,2],1,qtdPerguntas);
       end

       somaEntradas = round(sum(entradas(i,:))*100/(3*qtdPerguntas));
       
       if (somaEntradas <= 20)
           saidasDesejadas(i,:) = [0 0 1];
       elseif(somaEntradas >20)&&(somaEntradas <= 50)
           saidasDesejadas(i,:) = [0 1 0];
       elseif(somaEntradas >50)
           saidasDesejadas(i,:) = [1 0 0];
       end
    end
end