mkdir claude_monet 
touch inspector_arrival
mkdir claude_monet/kitchen
mkdir claude_monet/sanitation
mkdir claude_monet/cleaning
mkdir claude_monet/hall
mkdir claude_monet/office
mkdir claude_monet/kitchen/hot_station
mkdir claude_monet/kitchen/cold_room
touch claude_monet/kitchen/hot_station/hot_report
touch claude_monet/kitchen/hot_station/senya_check
touch claude_monet/kitchen/cold_room/fridge_temperature
touch claude_monet/kitchen/cold_room/fish_check
touch claude_monet/sanitation/inspection_act
touch claude_monet/sanitation/violations
touch claude_monet/cleaning/cleaning_schedule
touch claude_monet/hall/waiter_note
touch claude_monet/office/vika_response

echo "Горячий цех подготовлен к проверке
Рабочие поверхности очищены
Баринов проверил порядок лично" > claude_monet/kitchen/hot_station/hot_report

echo "Сеня убрал лишние продукты
Ножи лежат на своих местах
Срок хранения мяса не нарушен" > claude_monet/kitchen/hot_station/senya_check

echo "Утром температура четыре градуса
Днём температура пять градусов
Вечером температура четыре градуса" > claude_monet/kitchen/cold_room/fridge_temperature

echo "Федя проверил сибаса и дорадо
Свежая рыба перенесена в холодильник
Нарушений хранения рыбы нет" > claude_monet/kitchen/cold_room/fish_check

echo "Проверка началась до открытия ресторана
Инспектор осмотрел кухню и зал
Повторная проверка назначена на пятницу" > claude_monet/sanitation/inspection_act

echo "Нарушен порядок хранения одной коробки
Нарушена маркировка контейнера с соусом
График уборки висит не на своём месте" > claude_monet/sanitation/violations

echo "Уборка кухни проводится утром
Уборка зала проводится перед открытием
Вечером Лёва проверяет результат уборки" > claude_monet/cleaning/cleaning_schedule

echo "Официанты убрали столы перед проверкой
Настя проверила гостевую зону
Запасные скатерти сложены в шкаф" > claude_monet/hall/waiter_note

echo "Вика получила акт инспектора
Замечания будут исправлены до вечера
Ответственным назначен Лёва" > claude_monet/office/vika_response

echo "Инспектор приехал раньше назначенного времени
Баринов встретил проверку на кухне
Нагиев потребовал избежать штрафа" > inspector_arrival

chmod 755 claude_monet
chmod u=rwx,g=rx,o= claude_monet/kitchen
chmod 750 claude_monet/kitchen/hot_station
chmod u=rw,g=r,o= claude_monet/kitchen/hot_station/hot_report
chmod 640 claude_monet/kitchen/hot_station/senya_check
chmod u=rwx,g=rx,o= claude_monet/kitchen/cold_room
chmod 644 claude_monet/kitchen/cold_room/fridge_temperature
chmod u=rw,g=r,o= claude_monet/kitchen/cold_room/fish_check
chmod 750 claude_monet/sanitation
chmod u=rw,g=r,o= claude_monet/sanitation/inspection_act
chmod 640 claude_monet/sanitation/violations
chmod u=rwx,g=rx,o= claude_monet/cleaning
chmod 644 claude_monet/cleaning/cleaning_schedule
chmod 755 claude_monet/hall
chmod u=rw,g=r,o=r claude_monet/hall/waiter_note
chmod u=rwx,g=rx,o= claude_monet/office
chmod 640 claude_monet/office/vika_response
chmod u=rw,g=r,o= inspector_arrival

cp inspector_arrival claude_monet/office/arrival_copy
cp -r claude_monet/cleaning claude_monet/sanitation/cleaning_backup
ln -s claude_monet/sanitation/inspection_act inspection_link
ln -s ../sanitation claude_monet/kitchen/sanitation_access
ln claude_monet/sanitation/inspection_act claude_monet/sanitation/act_duplicate
cat claude_monet/kitchen/hot_station/hot_report claude_monet/kitchen/cold_room/fish_check > claude_monet/kitchen/stations_report
cat claude_monet/sanitation/violations >> claude_monet/office/vika_response
mv claude_monet/hall/waiter_note claude_monet/office/guest_zone_note

ls -lR | grep '^-' | sort -k5nr | head -5 
grep -rhi -e "наруш" -e "провер" claude_monet | grep -vi "повторн" | sort -r | head -6
grep -ril "уборк" claude_monet/cleaning claude_monet/sanitation/cleaning_backup | wc -l
{ head -qn1 claude_monet/kitchen/hot_station/*_report claude_monet/kitchen/hot_station/*_check claude_monet/kitchen/cold_room/*_report claude_monet/kitchen/cold_room/*_check; tail -qn1 claude_monet/kitchen/hot_station/*_report claude_monet/kitchen/hot_station/*_check claude_monet/kitchen/cold_room/*_report claude_monet/kitchen/cold_room/*_check; } | grep -i "провер\|наруш" | sort
grep -v "Баринов" claude_monet/kitchen/stations_report | grep -i 'провер\|рыб' | sort -r | wc -w
ls -lR | grep "^-" | awk '$2 == 2 {print}' | sort -k9
ls -lR | grep "^l" | sort -k9 -r | head -1

rm claude_monet/office/arrival_copy
rm inspection_link
rm claude_monet/kitchen/sanitation_access
rm claude_monet/sanitation/act_duplicate
rm claude_monet/office/guest_zone_note
rmdir claude_monet/hall
rm claude_monet/sanitation/violations
rm -r claude_monet/sanitation/cleaning_backup