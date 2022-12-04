paquets = rand(1000,42) *100;

NombreBonbons = zeros(1000, 3);

NombreBonbons(:,1) = sum(paquets < 40, 2);
NombreBonbons(:,2) = sum(paquets >= 40 & paquets < 75, 2);
NombreBonbons(:,3) = sum(paquets >= 75 , 2);

score_chaussard = sum(ismember(NombreBonbons, [17 11 14], 'rows'))

NombreBonbons(:,1) = sum(paquets < 35, 2);
NombreBonbons(:,2) = sum(paquets >= 35 & paquets < 55, 2);
NombreBonbons(:,3) = sum(paquets >= 55 , 2);

score_tournir = sum(ismember(NombreBonbons, [17 11 14], 'rows'))


