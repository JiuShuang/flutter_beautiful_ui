import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/constant/app_data.dart';
import 'package:saas_dashboard/entity/message/im_session.dart';

class SessionList extends StatefulWidget {
  final double width;
  final ValueChanged<ImSession> tapSession;
  const SessionList({super.key, required this.width, required this.tapSession});

  @override
  State<SessionList> createState() => _SessionListState();
}

class _SessionListState extends State<SessionList> {
  final List<String> _sessionType = ["All", "Personal", "Teams"];
  String _activeType = "Personal";
  int _openSessionId = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.27,
      padding: EdgeInsets.all(AppConstrain.paddingSmall),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(AppConstrain.borderRadius),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Message", style: TextTheme.of(context).bodyMedium),
              IconButton(
                onPressed: () {},
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.secondColor,
                  minimumSize: Size(10, 10),
                  maximumSize: Size(30, 30),
                  padding: EdgeInsets.all(5),
                ),
                icon: Icon(Icons.add, size: 12, color: AppColors.primaryColor),
              ),
            ],
          ),
          SizedBox(height: AppConstrain.paddingSmall),
          TextField(
            style: TextStyle(fontSize: 11),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: AppConstrain.paddingSmall,
                horizontal: 5,
              ),
              hintText: "Search",
              hintStyle: TextStyle(fontSize: 11),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppConstrain.paddingSmall),
            child: Row(
              children: _sessionType.map((value) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _activeType = value;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 250),
                      padding: EdgeInsets.symmetric(
                        vertical: AppConstrain.paddingSmall / 2,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: _activeType == value
                                ? AppColors.secondColor
                                : Color(0xffF2F2F4),
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          value,
                          style: TextStyle(
                            color: _activeType == value
                                ? AppColors.secondColor
                                : Color(0xff999999),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          ...sessionList.map((session) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _openSessionId = session.id;
                });
                widget.tapSession(session);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 250),
                padding: EdgeInsets.all(AppConstrain.paddingSmall),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    AppConstrain.borderRadius / 2,
                  ),
                  color: _openSessionId == session.id
                      ? Color(0xffF7F7FF)
                      : AppColors.primaryColor,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: AlignmentGeometry.bottomRight,
                      children: [
                        ClipOval(child: Image.asset(session.avatar, width: 32)),
                        Positioned(
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: session.isActive
                                  ? Color(0xff2CC84A)
                                  : Color(0xffF7F7F8),
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.primaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsGeometry.symmetric(
                          horizontal: AppConstrain.paddingSmall / 2,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              session.name,
                              style: TextTheme.of(context).bodySmall,
                            ),
                            Text(
                              session.latestMessage.text,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 8,
                                color: Color(0xff999999),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      session.latestMessage.sendTime,
                      style: TextStyle(fontSize: 8, color: Color(0xff999999)),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
