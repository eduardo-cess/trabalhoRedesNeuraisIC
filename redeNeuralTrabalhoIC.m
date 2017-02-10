clear;
qtdPerguntas = 12;
qtdAmostras = 500;
qtdAmostrasTreino = round(qtdAmostras*95/100); % 95% das amostras geradas serão usadas para treino e 5% para teste
[X D] = geraEntradasESaidasDesejadas(qtdAmostras,qtdPerguntas)
for i=1:qtdAmostrasTreino
    Xtreino(i,:) = X(i,:);
    Dtreino(i,:) = D(i,:);
end

Xteste = removerows(X,'ind',1:qtdAmostrasTreino);
Dteste = removerows(D,'ind',1:qtdAmostrasTreino);

R = ones(qtdPerguntas, 2);
R(:,2) = 3;

%criação da rede
net = newff(R,[20, 3],{'logsig','logsig'},'traingda');
net.trainParam.epochs = 2000;
net.trainParam.goal = 0.001;
net = train(net,Xtreino',Dtreino');
%simulação com o conjunto de teste
Y = sim(net,Xteste');

roundY = round(Y');

[roundY Dteste]

isequal(Dteste,roundY)