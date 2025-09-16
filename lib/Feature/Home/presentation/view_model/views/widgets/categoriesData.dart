
import 'package:flutter/cupertino.dart';

import '../../../../../../generated/l10n.dart';

final List<Map<String, String>> categoriesData = const [
  {"logo": "Assets/Categories/line-md_steering.png", "key": "Tires", "results": "420"},
  {"logo": "Assets/Categories/line-md_steering (1).png", "key": "Chassis", "results": "500"},
  {"logo": "Assets/Categories/line-md_steering (2).png", "key": "Engine", "results": "350"},
  {"logo": "Assets/Categories/—Pngtree—brake pad metal_3238119.png", "key": "Brakes", "results": "300"},
  {"logo": "Assets/Categories/line-md_steering (3).png", "key": "Filters", "results": "679"},
  {"logo": "Assets/Categories/line-md_steering (4).png", "key": "BeltsAndChains", "results": "250"},
  {"logo": "Assets/Categories/line-md_steering (15).png", "key": "Oils", "results": "168"},
  {"logo": "Assets/Categories/line-md_steering (5).png", "key": "SuspensionAndAlignment", "results": "941"},
  {"logo": "Assets/Categories/clean (1).png", "key": "Wipers", "results": "120"},
  {"logo": "Assets/Categories/line-md_steering (6).png", "key": "Exhaust", "results": "344"},
  {"logo": "Assets/Categories/line-md_steering (8).png", "key": "Accessories", "results": "3214"},
  {"logo": "Assets/Categories/line-md_steering (9).png", "key": "SparkPlugs", "results": "85"},
  {"logo": "Assets/Categories/line-md_steering (10).png", "key": "Lighting", "results": "190"},
  {"logo": "Assets/Categories/clean (3).png", "key": "ElectricalAndElectronics", "results": "676"},
  {"logo": "Assets/Categories/clean (2).png", "key": "Cooling", "results": "354"},
  {"logo": "Assets/Categories/line-md_steering (11).png", "key": "Tools", "results": "54"},
  {"logo": "Assets/Categories/line-md_steering (12).png", "key": "DriveShaft", "results": "47"},
  {"logo": "Assets/Categories/clean (2).png", "key": "AirConditioning", "results": "60"},
  {"logo": "Assets/Categories/line-md_steering (13).png", "key": "HosesAndPipes", "results": "88"},
  {"logo": "Assets/Categories/—Pngtree—durable car fuel injector with_18463113.png", "key": "FuelSystem", "results": "120"},
  {"logo": "Assets/Categories/clean (4).png", "key": "Stabilizers", "results": "75"},
  {"logo": "Assets/Categories/line-md_steering (14).png", "key": "Steering", "results": "95"},
];

String getCategoryName(BuildContext context, String key) {
  switch (key) {
    case "Tires": return S.of(context).Tires;
    case "Chassis": return S.of(context).Chassis;
    case "Engine": return S.of(context).Engine;
    case "Brakes": return S.of(context).Brakes;
    case "Filters": return S.of(context).Filters;
    case "BeltsAndChains": return S.of(context).BeltsAndChains;
    case "Oils": return S.of(context).Oils;
    case "SuspensionAndAlignment": return S.of(context).SuspensionAndAlignment;
    case "Wipers": return S.of(context).Wipers;
    case "Exhaust": return S.of(context).Exhaust;
    case "Accessories": return S.of(context).Accessories;
    case "SparkPlugs": return S.of(context).SparkPlugs;
    case "Lighting": return S.of(context).Lighting;
    case "ElectricalAndElectronics": return S.of(context).ElectricalAndElectronics;
    case "Cooling": return S.of(context).Cooling;
    case "Tools": return S.of(context).Tools;
    case "DriveShaft": return S.of(context).DriveShaft;
    case "AirConditioning": return S.of(context).AirConditioning;
    case "HosesAndPipes": return S.of(context).HosesAndPipes;
    case "FuelSystem": return S.of(context).FuelSystem;
    case "Stabilizers": return S.of(context).Stabilizers;
    case "Steering": return S.of(context).Steering;
    default: return key;
  }
}