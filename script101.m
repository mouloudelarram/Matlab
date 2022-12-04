clear all

load 'data.mat';

pays_index = find(strcmp(T(:,3), 'France'));

pays_data = T(pays_index, :);

dates = datenum(pays_data(:,4),"yyyy-mm-dd");

new_cases = pays_data(:,6);

new_cases(cellfun('isempty', new_cases)) = {0};

new_cases = cell2mat(new_cases);

new_cases(find(new_cases < 0)) = 0;

%plot(dates, new_cases);

set(gca, 'xtick', dates(1):45:dates(end));

datetick('x', "yy-mm-dd", 'keepticks');

v = [0 0 0 0 0 0 1/7 1/7 1/7 1/7 1/7 1/7 1/7];

new_cases_avg = conv(new_cases, v, 'same');

%hold on;

%plot(dates, new_cases_avg);

v2 = [ 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1];

personnes_malades = conv(new_cases, v2, 'same');

personnes_malades(find(personnes_malades == 0 )) = 1;

vitesse = (new_cases_avg./personnes_malades)*sum(v2);

plot(dates, vitesse, 'b');
set(gca, 'xtick', dates(1):60:dates(end));
datetick('x', "yy-mm-dd", 'keepticks');

line(dates,ones(1,numel(dates)));
