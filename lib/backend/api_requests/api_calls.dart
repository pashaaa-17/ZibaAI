import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start OpenAI ChatGPT Group Code

class OpenAIChatGPTGroup {
  static String baseUrl = 'https://api.openai.com/v1';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static SendFullPromptCall sendFullPromptCall = SendFullPromptCall();
}

class SendFullPromptCall {
  Future<ApiCallResponse> call({
    String? apiKey = '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',
    dynamic? promptJson,
  }) {
    final prompt = _serializeJson(promptJson);
    final body = '''
{
  "model": "gpt-3.5-turbo",
  "messages": ${prompt}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send Full Prompt',
      apiUrl: '${OpenAIChatGPTGroup.baseUrl}/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        ...OpenAIChatGPTGroup.headers,
        'Authorization': 'Bearer ${apiKey}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic createdTimestamp(dynamic response) => getJsonField(
        response,
        r'''$.created''',
      );
  dynamic role(dynamic response) => getJsonField(
        response,
        r'''$.choices[:].message.role''',
      );
  dynamic content(dynamic response) => getJsonField(
        response,
        r'''$.choices[:].message.content''',
      );
}

/// End OpenAI ChatGPT Group Code

class GnewsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'gnews',
      apiUrl:
          'https://gnews.io/api/v4/search?q=zambia&lang=en&apikey=3476be74770ce36c347db7cf151ffd27',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.articles[:].title''',
        true,
      );
  static dynamic srcname(dynamic response) => getJsonField(
        response,
        r'''$.articles[:].source.name''',
        true,
      );
  static dynamic srcurl(dynamic response) => getJsonField(
        response,
        r'''$.articles[:].source.url''',
        true,
      );
  static dynamic img(dynamic response) => getJsonField(
        response,
        r'''$.articles[:].image''',
        true,
      );
  static dynamic url(dynamic response) => getJsonField(
        response,
        r'''$.articles[:].url''',
        true,
      );
  static dynamic content(dynamic response) => getJsonField(
        response,
        r'''$.articles[:].content''',
        true,
      );
  static dynamic desc(dynamic response) => getJsonField(
        response,
        r'''$.articles[:].description''',
        true,
      );
  static dynamic articles(dynamic response) => getJsonField(
        response,
        r'''$.articles''',
      );
  static dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.articles[:].publishedAt''',
        true,
      );
}

class NewsdataioCall {
  static Future<ApiCallResponse> call() {
    final body = '''
{
  "query": "{\\"\$query\\":{\\"\$and\\":[{\\"locationUri\\":\\"http://en.wikipedia.org/wiki/Zambia\\"},{\\"lang\\":\\"eng\\"}]},\\"\$filter\\":{\\"forceMaxDataTimeWindow\\":\\"31\\",\\"isDuplicate\\":\\"skipDuplicates\\"}}",
  "resultType": "articles",
  "articlesSortBy": "date",
  "articlesCount": 20,
  "includeArticleImage": true,
  "includeArticleLinks": true,
  "includeArticleOriginalArticle": true,
  "articleBodyLen": -1,
  "apiKey": "ff553b72-afdb-4a15-9b2b-8db2fc81fcc8"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'newsdataio',
      apiUrl: 'https://www.newsapi.ai/api/v1/article/getArticles',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic results(dynamic response) => getJsonField(
        response,
        r'''$.articles.results''',
        true,
      );
  static dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.articles.results[:].date''',
        true,
      );
  static dynamic titl(dynamic response) => getJsonField(
        response,
        r'''$.articles.results[:].title''',
        true,
      );
  static dynamic body(dynamic response) => getJsonField(
        response,
        r'''$.articles.results[:].body''',
        true,
      );
  static dynamic src(dynamic response) => getJsonField(
        response,
        r'''$.articles.results[:].source.title''',
        true,
      );
  static dynamic srcurl(dynamic response) => getJsonField(
        response,
        r'''$.articles.results[:].links''',
        true,
      );
  static dynamic img(dynamic response) => getJsonField(
        response,
        r'''$.articles.results[:].image''',
        true,
      );
  static dynamic articles(dynamic response) => getJsonField(
        response,
        r'''$.articles''',
        true,
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
