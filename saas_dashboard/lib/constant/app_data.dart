import 'dart:math';
import 'dart:ui';

import 'package:saas_dashboard/entity/analytics/analytics_selling_product.dart';
import 'package:saas_dashboard/entity/analytics/customer.dart';
import 'package:saas_dashboard/entity/calendar/calendar.dart';
import 'package:saas_dashboard/entity/dashboard/recent_order.dart';
import 'package:saas_dashboard/entity/dashboard/summary_data.dart';
import 'package:saas_dashboard/entity/dashboard/top_selling_data.dart';
import 'package:saas_dashboard/entity/invoice/invoice.dart';
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

List<Calendar> calendarList = [
  Calendar(
    title: "Free Day",
    time: DateTime(DateTime.now().year, DateTime.now().month, 16, 6),
    lerver: CalendarLever.media,
  ),
  Calendar(
    title: "Tecent Meeting",
    time: DateTime(DateTime.now().year, DateTime.now().month, 16, 2),
    lerver: CalendarLever.high,
  ),
  Calendar(
    title: "Tecent Meeting",
    time: DateTime(DateTime.now().year, DateTime.now().month, 16, 4),
    lerver: CalendarLever.low,
  ),
  Calendar(
    title: "Part Time",
    time: DateTime(DateTime.now().year, DateTime.now().month, 2, 3),
    lerver: CalendarLever.low,
  ),
  Calendar(
    title: "Invited By Friends",
    time: DateTime(DateTime.now().year, DateTime.now().month, 23, 4),
    lerver: CalendarLever.media,
  ),
  Calendar(
    title: "Christmas Day",
    time: DateTime(DateTime.now().year, DateTime.now().month, 12, 5),
    lerver: CalendarLever.high,
  ),
  Calendar(
    title: "Victory Day",
    time: DateTime(DateTime.now().year, DateTime.now().month, 8, 6),
    lerver: CalendarLever.high,
  ),
];

List<AnalyticsSellingProduct> productList = List.generate(8, (index) {
  return AnalyticsSellingProduct(
    sn: index,
    image: Assets.images.airdot.path,
    name: "Airdot",
    price: 15,
    totalOrder: "20,000",
    totalSales: "3,46,660",
  );
});

List<Customer> customerList = List.generate(10, (index) {
  return Customer(
    avatar: Assets.images.avatar.path,
    name: "John Deo",
    email: "johndoe2211@gmail.com",
    phone: "+33757005467",
    gender: index % 2 == 0 ? "Male" : "Female",
  );
});

List<RecentOrder> ordersList = [
  RecentOrder(
    no: "#876364",
    image: Assets.images.product,
    name: "Camera Lens",
    price: 178,
    totalOrder: 325,
    totalAmount: "1,46,660",
  ),
  RecentOrder(
    no: "#876365",
    image: Assets.images.product,
    name: "Black Sleep Dress",
    price: 14,
    totalOrder: 53,
    totalAmount: "2,416,660",
  ),
  RecentOrder(
    no: "#876366",
    image: Assets.images.product,
    name: "Argan Oil",
    price: 21,
    totalOrder: 78,
    totalAmount: "1,461,60",
  ),
  RecentOrder(
    no: "#876367",
    image: Assets.images.product,
    name: "EAU DE Parfum",
    price: 32,
    totalOrder: 98,
    totalAmount: "1,46,60",
  ),
];

final List<SummaryData> summaryDataList = [
  SummaryData(
    icon: Assets.images.heart,
    backgroundColor: Color(0xffEFF4FF),
    number: "178+",
    type: "Save Products",
  ),
  SummaryData(
    icon: Assets.images.game,
    backgroundColor: Color(0xffFFF7E1),
    number: "20+",
    type: "Stock Products",
  ),
  SummaryData(
    icon: Assets.images.bag,
    backgroundColor: Color(0xffFFF4F0),
    number: "190+",
    type: "Sales Products",
  ),
  SummaryData(
    icon: Assets.images.work,
    backgroundColor: Color(0xffEFEFFF),
    number: "12+",
    type: "Job Application",
  ),
];

List<TopSellingProduct> topSellingProducts = [
  TopSellingProduct(
    image: Assets.images.iPhone12.path,
    name: "iPhone12",
    star: 4,
    price: 987,
  ),
  TopSellingProduct(
    image: Assets.images.iPhone12.path,
    name: "iPhone12",
    star: 4,
    price: 987,
  ),
];

List<Invoice> invoiceList = List.generate(10, (index) {
  final List<InvoiceStatus> statusList = InvoiceStatus.values;
  final randomIndex = Random().nextInt(statusList.length);
  return Invoice(
    id: "#${index}76364",
    avatar: Assets.images.avatar.path,
    name: "Arrora gaur",
    email: "arroragaur@gmail.com",
    date: "12 Dec, 2020",
    status: statusList[randomIndex],
    isStar: index % 2 == 0 ? true : false,
  );
});
