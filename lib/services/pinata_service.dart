import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class PinataService {

  static final String? _apiKey = dotenv.env['PINATA_API_KEY'];
  static final String? _secretKey = dotenv.env['PINATA_SECRET_KEY'];
  final String pinataBaseUrl = 'https://api.pinata.cloud/pinning/pinFileToIPFS';

  Future<String?> uploadImageToPinata(File imageFile) async {
    final Uri uri = Uri.parse(pinataBaseUrl);

    var request = http.MultipartRequest('POST', uri)
      ..headers.addAll({
        'pinata_api_key': _apiKey!,
        'pinata_secret_api_key': _secretKey!,
      });

    var pic = await http.MultipartFile.fromPath('file', imageFile.path);
    request.files.add(pic);

    try {
      final response = await request.send();
      final respStr = await response.stream.bytesToString();
      final data = jsonDecode(respStr);

      if (response.statusCode == 200) {
        // Get the IPFS link from the response
        String ipfsUrl = 'https://ipfs.io/ipfs/${data['IpfsHash']}';
        return ipfsUrl;
      } else {
        debugPrint("Error uploading image: ${data['error']}");
        return null;
      }
    } catch (e) {
      debugPrint("Error: $e");
      return null;
    }
  }
}
