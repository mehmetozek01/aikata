import 'package:aikata_v2/constants/consts.dart';
import 'package:aikata_v2/widgets/class_parent.dart';

class SpecialModel extends ParentModel {
  SpecialModel(
      {required super.image,
      required super.title,
      required super.subtitle,
      required super.percentage});
}

List<SpecialModel> specialModel = [
  SpecialModel(
    image: tTodayImg,
    title: 'Bugüne Özel!',
    subtitle: 'Her sipariş için indirim kazanın, sadece bugün için geçerli',
    percentage: '30%',
  ),
  SpecialModel(
    image: tWerollaImg,
    title: 'Bugüne Özel!',
    subtitle: 'Her sipariş için indirim kazanın, sadece bugün için geçerli',
    percentage: '30%',
  ),
  SpecialModel(
    image: tViyaraImg,
    title: 'Bugüne Özel!',
    subtitle: 'Her sipariş için indirim kazanın, sadece bugün için geçerli',
    percentage: '30%',
  ),
  SpecialModel(
    image: tMocoImg,
    title: 'Bugüne Özel!',
    subtitle: 'Her sipariş için indirim kazanın, sadece bugün için geçerli',
    percentage: '30%',
  ),
  SpecialModel(
    image: tBlackGirlImg,
    title: 'Bugüne Özel!',
    subtitle: 'Her sipariş için indirim kazanın, sadece bugün için geçerli',
    percentage: '30%',
  ),
];
