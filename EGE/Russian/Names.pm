package EGE::Russian::Names;

use strict;
use warnings;
use utf8;

use EGE::Random;
use EGE::Russian;

our @male = qw(
Августин
Авдей
Авраам
Агафон
Адам
Адриан
Аким
Алан
Александр
Алексей
Альберт
Альфред
Амвросий
Ананий
Анастасий
Анатолий
Андрей
Антон
Аристарх
Аркадий
Арнольд
Арсений
Артем
Артемий
Артур
Архип
Афанасий
Богдан
Борис
Булат
Вадим
Валентин
Валерий
Василий
Вениамин
Виктор
Виссарион
Виталий
Владимир
Владислав
Всеволод
Вячеслав
Геннадий
Георгий
Герман
Глеб
Григорий
Даниил
Дементий
Демьян
Денис
Дмитрий
Евгений
Егор
Ефим
Захар
Зиновий
Иван
Игнатий
Игорь
Илья
Иннокентий
Кирилл
Клим
Константин
Кузьма
Лавр
Лаврентий
Лев
Леонид
Леонтий
Лука
Лукьян
Макарий
Максимилиан
Марат
Матвей
Митрофан
Михаил
Михей
Наум
Нестор
Николай
Олег
Олесь
Осип
Оскар
Павел
Петр
Платон
Родион
Роман
Ростислав
Савва
Самсон
Семён
Серафим
Сергей
Степан
Тимофей
Тимур
Тихон
Устин
Федор
Федот
Филимон
Флор
Фома
Харитон
Христиан
Эдгар
Эдуард
Эльдар
Эмиль
Эммануил
Эрик
Юлиан
Юлий
Юрий
Яков
Ян
Яромир
Ярослав
);

our @female = qw(
Аврора
Агата
Агнесса
Агния
Ада
Аза
Алевтина
Александра
Алина
Алиса
Алла
Альбина
Альфреа
Анастасия
Ангелина
Анжелика
Анита
Анна
Антонина
Анфиса
Арина
Астра
Беата
Белла
Берта
Богдана
Борислава
Бронислава
Валентина
Валерия
Ванда
Варвара
Василиса
Венера
Вера
Вероника
Веста
Виктория
Виолетта
Галина
Гелена
Гелла
Генриетта
Гертруда
Глафира
Глория
Дарья
Джульетта
Диана
Дина
Доминика
Ева
Евгения
Евдокия
Екатерина
Елена
Елизавета
Жанна
Зинаида
Зоя
Иветта
Изабелла
Изольда
Инара
Инга
Инесса
Инна
Ирина
Ирма
Камилла
Капитолина
Карина
Каролина
Катарина
Кира
Клавдия
Клара
Кристина
Ксения
Кузьма
Лада
Лайма
Лариса
Леся
Лиана
Лидия
Лилия
Лиана
Людмила
Майя
Маргарита
Марианна
Марина
Мария
Марта
Марфа
Милена
Мирра
Надежда
Наталия
Наталья
Нина
Нонна
Нора
Оксана
Олеся
Ольга
Полина
Прасковья
Раиса
Регина
Рената
Римма
Роза
Роксана
Руслана
Руфина
Сара
Светлана
Серафима
София
Станислава
Стелла
Стефания
Сюзанна
Таира
Таисия
Тамара
Татьяна
Ульяна
Фаина
Фекла
Флора
Фома
Франсуаза
Фрида
Христина
Эдита
Элеонора
Эвелина
Эльвира
Эльза
Эмилия
Эрика
Юлия
Юнона
Ядвига
Яна
Ярослава
);

our @list = (@male, @female);

my ($h, $hm, $hf);

sub different_males { EGE::Russian::different(\$hm, \@male, $_[0]) }
sub different_females { EGE::Russian::different(\$hf, \@female, $_[0]) }

sub different_names {
    my ($count) = @_;
    unless ($h) {
        $h = {};
        for (@male) {
            push @{$h->{substr($_, 0, 1)}}, { name => $_, gender => 0 };
        }
        for (@female) {
            push @{$h->{substr($_, 0, 1)}}, { name => $_, gender => 1 }
        }
    }
    map { rnd->pick(@{$h->{$_}}) } rnd->pick_n($count, keys %{$h});
}

# Родительный падеж.
sub genitive {
    my ($name) = @_;
    for ($name) {
        s/[йь]$/я/ ||
        s/([егк])а$/$1и/ ||
        s/а$/ы/ ||
        s/я$/и/ ||
        s/ев$/ьва/ ||
        s/$/а/;
    }
    $name;
}

# Творительный падеж.
sub ablative {
    my ($name) = @_;
    for ($name) {
        s/[йь]$/ем/ ||
        s/еа$/еей/ ||
        s/а$/ой/ ||
        s/Илья$/Ильёй/ ||
        s/я$/ей/ ||
        s/ев$/ьвом/ ||
        s/$/ом/;
    }
    $name;
}

# Дательный падеж.
sub dative {
    my ($name) = @_;
    for ($name) {
        s/[йь]$/ю/ ||
        s/а$/е/ ||
        s/ия$/ии/ ||
        s/я$/е/ ||
        s/ев$/ьву/ ||
        s/$/у/;
    }
    $name;
}

1;
