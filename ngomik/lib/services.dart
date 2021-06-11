import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ngomik/athome.dart';
import 'package:ngomik/chapterlist.dart';
import 'package:ngomik/cover.dart';
import 'package:ngomik/login.dart';
import 'package:ngomik/logout.dart';
import 'package:ngomik/mangalist.dart';
import 'package:ngomik/user.dart';

class Services {
  static Future<Login> postLogin(String username, String password) async {
    const String url = 'https://api.mangadex.org/auth/login';
    Map body = {"username": username, "password": password};
    try {
      final response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: json.encode(body));
      if (200 == response.statusCode) {
        final Login login = loginFromJson(response.body);
        return login;
      } else {
        return Login();
      }
    } catch (e) {
      return Login();
    }
  }

  static Future<Logout> postLogout() async {
    const String url = 'https://api.mangadex.org/auth/logout';
    try {
      final response = await http.post(url);
      if (200 == response.statusCode) {
        final Logout logout = logoutFromJson(response.body);
        return logout;
      } else {
        return Logout();
      }
    } catch (e) {
      return Logout();
    }
  }

  static Future<MangaList> getMangaList() async {
    String url = 'https://api.mangadex.org/manga/';
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final MangaList manga = mangaListFromJson(response.body);
        return manga;
      } else {
        return MangaList();
      }
    } catch (e) {
      return MangaList();
    }
  }

  static getCoverImage(String id, String img) {
    String url = 'https://uploads.mangadex.org/covers/' + id + '/' + img;
    return url;
  }

  static Future<Cover> getCover(String id) async {
    String url = 'https://api.mangadex.org/cover/' + id;
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final Cover cover = coverFromJson(response.body);
        return cover;
      } else {
        return Cover();
      }
    } catch (e) {
      return Cover();
    }
  }

  static Future<ChapterList> getChapterList(String id) async {
    String url =
        'https://api.mangadex.org/chapter?order[chapter]=desc&translatedLanguage[0]=en&limit=100&manga=' +
            id;
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final ChapterList chapterList = chapterListFromJson(response.body);
        return chapterList;
      } else {
        return ChapterList();
      }
    } catch (e) {
      return ChapterList();
    }
  }

  static Future<AtHome> getBaseUrl(String id) async {
    String url = 'https://api.mangadex.org/at-home/server/' + id;
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final AtHome atHome = atHomeFromJson(response.body);
        return atHome;
      } else {
        return AtHome();
      }
    } catch (e) {
      return AtHome();
    }
  }

  static getChapterImage(String baseUrl, String hash, String data) {
    String url = baseUrl + "/data/" + hash + "/" + data;
    return url;
  }

  static Future<User> getUser(String tokens) async {
    String url = 'https://api.mangadex.org/user/me';
    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokens',
      });
      if (200 == response.statusCode) {
        final User user = userFromJson(response.body);
        return user;
      } else {
        return User();
      }
    } catch (e) {
      return User();
    }
  }
}
