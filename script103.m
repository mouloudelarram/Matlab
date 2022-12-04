load 'data.mat';
pays = ["France", "Sweden", "United Kingdom" , "India"];
v = [0 0 0 0 0 0 1/7 1/7 1/7 1/7 1/7 1/7 1/7];
v2 = [ 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1];



pays_index = find(strcmp(T(:,3), "France"));
pays_data = T(pays_index, :);
dates = datenum(pays_data(:,4),"yyyy-mm-dd");
new_cases = pays_data(:,9);
new_cases(cellfun('isempty', new_cases)) = {0};
new_cases = cell2mat(new_cases);
new_cases(find(new_cases < 0)) = 0;
new_cases_avg = conv(new_cases, v, 'same');
personnes_malades = conv(new_cases, v2, 'same');
personnes_malades(find(personnes_malades == 0 )) = 1;
vitesse = (new_cases_avg./personnes_malades)*sum(v2);
plot(dates, vitesse, 'b');
hold on;

line(dates,ones(1,numel(dates)));

pays_index = find(strcmp(T(:,3), "United Kingdom"));
pays_data = T(pays_index, :);
dates = datenum(pays_data(:,4),"yyyy-mm-dd");
new_cases = pays_data(:,9);
new_cases(cellfun('isempty', new_cases)) = {0};
new_cases = cell2mat(new_cases);
new_cases(find(new_cases < 0)) = 0;
new_cases_avg = conv(new_cases, v, 'same');
personnes_malades = conv(new_cases, v2, 'same');
personnes_malades(find(personnes_malades == 0 )) = 1;
vitesse = (new_cases_avg./personnes_malades)*sum(v2);
plot(dates, vitesse, 'y');
hold on;



pays_index = find(strcmp(T(:,3), "Sweden"));
pays_data = T(pays_index, :);
dates = datenum(pays_data(:,4),"yyyy-mm-dd");
new_cases = pays_data(:,9);
new_cases(cellfun('isempty', new_cases)) = {0};
new_cases = cell2mat(new_cases);
new_cases(find(new_cases < 0)) = 0;
new_cases_avg = conv(new_cases, v, 'same');
personnes_malades = conv(new_cases, v2, 'same');
personnes_malades(find(personnes_malades == 0 )) = 1;
vitesse = (new_cases_avg./personnes_malades)*sum(v2);
plot(dates, vitesse, 'r');
hold on;

pays_index = find(strcmp(T(:,3), "India"));
pays_data = T(pays_index, :);
dates = datenum(pays_data(:,4),"yyyy-mm-dd");
new_cases = pays_data(:,9);
new_cases(cellfun('isempty', new_cases)) = {0};
new_cases = cell2mat(new_cases);
new_cases(find(new_cases < 0)) = 0;
new_cases_avg = conv(new_cases, v, 'same');
personnes_malades = conv(new_cases, v2, 'same');
personnes_malades(find(personnes_malades == 0 )) = 1;
vitesse = (new_cases_avg./personnes_malades)*sum(v2);
plot(dates, vitesse, 'g');
hold on;



legend('France', 'Taux a 1', ' Kingdom', 'Sweden', 'Indai');
