import 'dart:ui';

import 'package:saas_dashboard/entity/message/im_message.dart';
import 'package:saas_dashboard/entity/message/im_session.dart';
import 'package:saas_dashboard/entity/schedule/task.dart';
import 'package:saas_dashboard/gen/assets.gen.dart';

List<Task> todoList = [
  Task(
    name: "Ui Design",
    icon: Assets.images.figma.path,
    iconBackgroundColor: Color(0xffF6EEFF),
    startDate: "03/12/2021",
    endDate: "5/12/2021",
    member: 4,
    status: TaskStatus.pending,
    detail: 'Discussion for management dashboard ui design',
    lever: TaskLever.low,
    commentNum: 112,
    likeNum: 154,
    image: Assets.images.taskImage.path,
  ),
  Task(
    name: "Logo Design",
    icon: Assets.images.ai.path,
    iconBackgroundColor: Color(0xffFFF2E5),
    startDate: "03/12/2021",
    endDate: "5/12/2021",
    member: 3,
    status: TaskStatus.pending,
    detail: 'Discussion for management dashboard ui design',
    lever: TaskLever.media,
    commentNum: 112,
    likeNum: 154,
    image: Assets.images.taskImage.path,
  ),
];
List<Task> doingList = [
  Task(
    name: "Ui Design",
    icon: Assets.images.figma.path,
    iconBackgroundColor: Color(0xffF6EEFF),
    startDate: "03/12/2021",
    endDate: "5/12/2021",
    member: 5,
    status: TaskStatus.running,
    detail: 'Discussion for management dashboard ui design',
    lever: TaskLever.high,
    commentNum: 112,
    likeNum: 154,
    image: Assets.images.taskImage.path,
  ),
  Task(
    name: "Logo Design",
    icon: Assets.images.ai.path,
    iconBackgroundColor: Color(0xffFFF2E5),
    startDate: "03/12/2021",
    endDate: "5/12/2021",
    member: 4,
    status: TaskStatus.running,
    detail: 'Discussion for management dashboard ui design',
    lever: TaskLever.low,
    commentNum: 112,
    likeNum: 154,
    image: Assets.images.taskImage.path,
  ),
];
List<Task> doneList = [
  Task(
    name: "Ui Design",
    icon: Assets.images.figma.path,
    iconBackgroundColor: Color(0xffF6EEFF),
    startDate: "03/12/2021",
    endDate: "5/12/2021",
    member: 1,
    status: TaskStatus.done,
    detail: 'Discussion for management dashboard ui design',
    lever: TaskLever.media,
    commentNum: 112,
    likeNum: 154,
    image: Assets.images.taskImage.path,
  ),
  Task(
    name: "Logo Design",
    icon: Assets.images.ai.path,
    iconBackgroundColor: Color(0xffFFF2E5),
    startDate: "03/12/2021",
    endDate: "5/12/2021",
    member: 3,
    status: TaskStatus.done,
    detail: 'Discussion for management dashboard ui design',
    lever: TaskLever.high,
    commentNum: 112,
    likeNum: 154,
    image: Assets.images.taskImage.path,
  ),
];

List<ImMessage> messageList = [
  ImMessage(
    isMe: false,
    text:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
    sendTime: "1 min ago",
  ),
  ImMessage(isMe: true, text: "Lorem Ipsum is simply ", sendTime: "9 min ago"),
  ImMessage(
    isMe: false,
    text:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
    sendTime: "15 min ago",
  ),
  ImMessage(
    isMe: false,
    text:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
    sendTime: "21 min ago",
  ),
  ImMessage(
    isMe: true,
    text:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
    sendTime: "21 min ago",
  ),
];

List<ImSession> sessionList = [
  ImSession(
    id: 0,
    messageList[0],
    name: "Shelby Goode",
    avatar: Assets.images.avatar.path,
    isActive: false,
  ),
  ImSession(
    id: 1,
    messageList[1],
    name: "Shelby Goode",
    avatar: Assets.images.avatar.path,
    isActive: true,
  ),
  ImSession(
    id: 2,
    messageList[2],
    name: "Shelby Goode",
    avatar: Assets.images.avatar.path,
    isActive: true,
  ),
  ImSession(
    id: 3,
    messageList[3],
    name: "Shelby Goode",
    avatar: Assets.images.avatar.path,
    isActive: false,
  ),
];
