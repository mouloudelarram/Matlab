M = zeros(101,101);

for p_rose = 0:100
  for p_bleu=0:100
        if(p_rose + p_bleu <=100) %On exclue les valeur de proba impossible
        p_vert = 100 - p_rose - p_bleu;
        %Bonbons = rand (1000, 42) *100;

        paquets = rand(1000,42) *100;

NombreBonbons = zeros(1000, 3);

NombreBonbons(:,1) = sum(paquets < 40, 2);
NombreBonbons(:,2) = sum(paquets >= 40 & paquets < 75, 2);
NombreBonbons(:,3) = sum(paquets >= 75 , 2);

        %nombre_rose = sum (Bonbons<p_rose, 2);
        %nombre_bleu = sum(Bonbons>=p_rose & Bonbons <p_rose + p_bleu, 2);
        %nombre_vert = sum(Bonbons >= p_rose + p_bleu, 2);
        %Nombre_Bonbon = [nombre_rose nombre_bleu nombre_vert];
        %total = sum(ismember (Nombre_Bonbon, [17 11 14], 'rows'));

        total = sum(ismember (NombreBonbons, [17 11 14], 'rows'));
        M(p_rose+1, p_bleu+1) = total;
        end
  end
end


prouge = 0:1:100;
pjaune = 0:1:100;

surf(pjaune ,prouge ,M)
xlabel( 'pjaune') ;
ylabel( 'prouge' );
