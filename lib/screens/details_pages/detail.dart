import 'package:flutter/material.dart';
import 'package:flutter_task_app_release/models/task.dart';
import 'package:flutter_task_app_release/screens/details_pages/widgets/date_picker.dart';
import 'package:flutter_task_app_release/screens/details_pages/widgets/task_timeline.dart';
import 'package:flutter_task_app_release/screens/details_pages/widgets/task_title.dart';

class DetailPage extends StatelessWidget {
  final Task task;
  DetailPage(this.task);

  @override
  Widget build(BuildContext context) {
    final detailList = task.desc;
    return Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            _buildAppBar(context),
            SliverToBoxAdapter(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    DatePicker(),
                    TaskTitle(),
                  ],
                ),
              ),
            ),
            detailList == null
                ? SliverFillRemaining(
                    child: Container(
                        color: Colors.white,
                        child: const Center(
                            child: Text(
                          'No task today!',
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ))),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (_, index) => TaskTimeLine(detailList[index],),
                        childCount: detailList.length)),
          ],
        ));
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 90,
      backgroundColor: Colors.black,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back_ios),
        iconSize: 18,
      ),
      actions: const [
        Icon(
          Icons.more_vert,
          size: 30,
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '${task.title}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'You have ${task.left} task(s) for today!',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
