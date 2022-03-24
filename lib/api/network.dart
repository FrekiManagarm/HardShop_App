import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/cpu.dart';

class CPUNetwork {
  static const String urlGetCPU = 'http://localhost:8000/api/CPUs';

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

  
}
