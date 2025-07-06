import 'package:ai_assitance/controller/translate_controller.dart';
import 'package:ai_assitance/helper/global.dart';
import 'package:ai_assitance/widgets/custom_loading.dart';
import 'package:ai_assitance/widgets/language_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslateFeature extends StatefulWidget {
  const TranslateFeature({super.key});

  @override
  State<TranslateFeature> createState() => _TranslateFeatureState();
}

class _TranslateFeatureState extends State<TranslateFeature> {
  final _c = TranslateController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi Language Translator'),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          top: mq.height * 0.02,
          bottom: mq.height * 0.1,
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => Get.bottomSheet(LanguageSheet(
                  c: _c,
                  s: _c.from,
                )),
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: mq.width * 0.4,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:
                      Obx(() => Text(_c.from.isEmpty ? 'Auto' : _c.from.value)),
                ),
              ),
              IconButton(
                onPressed: () {
                  _c.swapLanguages();
                },
                icon: Obx(
                  () => Icon(
                    CupertinoIcons.repeat,
                    color: _c.from.isEmpty && _c.to.isEmpty
                        ? Colors.grey
                        : Colors.blue,
                  ),
                ),
              ),
              InkWell(
                onTap: () => Get.bottomSheet(LanguageSheet(
                  c: _c,
                  s: _c.to,
                )),
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: mq.width * 0.4,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Obx(() => Text(_c.to.isEmpty ? 'To' : _c.to.value)),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mq.width * 0.04, vertical: mq.height * 0.035),
            child: TextFormField(
              controller: _c.textC,
              textAlign: TextAlign.center,
              minLines: 5,
              maxLines: null,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                  hintText: 'Translate anything you want here ... ',
                  hintStyle: TextStyle(
                    fontSize: 13.5,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ),
          Obx(() => _translateResult()),
          SizedBox(
            height: mq.height * 0.04,
          ),
          GestureDetector(
            onTap: () {
              _c.translate();
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1, color: Colors.blue.shade600),
                  color: Colors.blue.shade600),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(15),
              child: Text(
                'Translate',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _translateResult() => switch (_c.status.value) {
        Status.none => const SizedBox(),
        Status.complete => Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mq.width * 0.04,
            ),
            child: TextFormField(
              controller: _c.resultC,
              textAlign: TextAlign.center,
              maxLines: null,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),
            ),
          ),
        Status.loading => Align(child: CustomLoading())
      };
}
