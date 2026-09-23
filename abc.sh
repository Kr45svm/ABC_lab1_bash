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