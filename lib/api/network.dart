import 'package:hardshopapp/Models/case.dart';
import 'package:hardshopapp/Models/cooling.dart';
import 'package:hardshopapp/Models/gpu.dart';
import 'package:hardshopapp/Models/hdd.dart';
import 'package:hardshopapp/Models/motherboard.dart';
import 'package:hardshopapp/Models/psu.dart';
import 'package:hardshopapp/Models/ram.dart';
import 'package:hardshopapp/Models/ssd.dart';
import 'package:http/http.dart' as http;
import '../Models/cpu.dart';

class Network {
  static const String urlGetCPU = 'http://localhost:8000/api/CPUs';
  static const String urlGetGPU = 'http://localhost:8000/api/GPUs';
  static const String urlGetRAM = 'http://localhost:8000/api/RAMs';
  static const String urlGetCooling = 'http://localhost:8000/api/Coolings';
  static const String urlGetMotherboard = 'http://localhost:8000/api/MotherBoards';
  static const String urlGetCases = 'http://localhost:8000/api/Boitiers';
  static const String urlGetSSDs = 'http://localhost:8000/api/SSDs';
  static const String urlGetHDDs = 'http://localhost:8000/api/HDDs';
  static const String urlGetPSUs = 'http://localhost:8000/api/PSUs';

  static Future<List<Cpu>> getCPU() async {
    try {
      final response = await http.get(Uri.parse(urlGetCPU));
      if (response.statusCode == 200) {
        final List<Cpu> cpus = cpuFromJson(response.body);
        return cpus;
      } else {
        throw Exception(response);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<Gpu>> getGPU() async {
    try {
      final response = await http.get(Uri.parse(urlGetGPU));
      // print(response.body);
      if (response.statusCode == 200) {
        final List<Gpu> gpus = gpuFromJson(response.body);
        return gpus;
      } else {
        throw Exception(response);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<Ram>> getRAM() async {
    try {
      final response = await http.get(Uri.parse(urlGetRAM));
      if (response.statusCode == 200) {
        final List<Ram> rams = ramFromJson(response.body);
        return rams;
      } else {
        throw Exception(response);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<Cooling>> getCooling() async {
    try {
      final response = await http.get(Uri.parse(urlGetCooling));
      if (response.statusCode == 200) {
        final List<Cooling> coolings = coolingFromJson(response.body);
        return coolings;
      } else {
        throw Exception(response);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<MotherBoard>> getMotherBoard() async {
    try {
      final response = await http.get(Uri.parse(urlGetMotherboard));
      if (response.statusCode == 200) {
        final List<MotherBoard> motherboards = motherBoardFromJson(response.body);
        return motherboards;
      } else {
        throw Exception(response);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<Boitier>> getCase() async {
    try {
      final response = await http.get(Uri.parse(urlGetCases));
      if (response.statusCode == 200) {
        final List<Boitier> boitiers = boitierFromJson(response.body);
        return boitiers;
      } else {
        throw Exception(response);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<Ssd>> getSSD() async {
    try {
      final response = await http.get(Uri.parse(urlGetSSDs));
      if (response.statusCode == 200) {
        final List<Ssd> ssds = ssdFromJson(response.body);
        return ssds;
      } else {
        throw Exception(response);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<Hdd>> getHDD() async {
    try {
      final response = await http.get(Uri.parse(urlGetHDDs));
      if (response.statusCode == 200) {
        final List<Hdd> hdds = hddFromJson(response.body);
        return hdds;
      } else {
        throw Exception(response);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<Psu>> getPSU() async {
    try {
      final response = await http.get(Uri.parse(urlGetPSUs));
      if (response.statusCode == 200) {
        final List<Psu> psus = psuFromJson(response.body);
        return psus;
      } else {
        throw Exception(response);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
