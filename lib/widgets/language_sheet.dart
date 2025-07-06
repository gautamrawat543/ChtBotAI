import 'package:ai_assitance/controller/translate_controller.dart';
import 'package:ai_assitance/helper/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageSheet extends StatefulWidget {
  final TranslateController c;
  final RxString s;
  const LanguageSheet({super.key, required this.c, required this.s});

  @override
  State<LanguageSheet> createState() => _LanguageSheetState();
}

class _LanguageSheetState extends State<LanguageSheet> {
  final _search = ''.obs;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: mq.height * 0.5,
      padding: EdgeInsets.only(
        left: mq.width * 0.04,
        right: mq.width * 0.04,
        top: mq.height * 0.02,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          TextFormField(
            // controller: _c.textC,
            onChanged: (s) => _search.value = s.toLowerCase(),
            textAlign: TextAlign.center,
            onTapOutside: (e) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.translate_rounded, color: Colors.blue),
                hintText: 'Search Language',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
          Expanded(
            child: Obx(
              () {
                final List<String> list = _search.isEmpty
                    ? widget.c.lang
                    : widget.c.lang
                        .where((e) => e.toLowerCase().contains(_search.value))
                        .toList();
                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(
                    top: mq.height * 0.02,
                    left: 6,
                  ),
                  itemCount: list.length,
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      onTap: () {
                        widget.s.value = list[index];
                        Get.back();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: mq.height * 0.02),
                        child: Text(list[index]),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
