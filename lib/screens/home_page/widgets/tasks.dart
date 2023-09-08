import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_app_release/models/task.dart';
import 'package:flutter_task_app_release/screens/details_pages/detail.dart';

class Tasks extends StatelessWidget {
  Tasks({super.key});

  final tasksList = Task.generateTasks();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
        itemCount: tasksList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemBuilder: (context, index) =>
        tasksList[index].isLast ? _buildAddTask() : _buildTask(context, tasksList[index])),
    );
  }

  Widget _buildAddTask() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(20),
      dashPattern: const [10, 10],
      color: Colors.grey,
      strokeWidth: 2,
      child: const Center(
        child: Text(
          '+ Add',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildTask(BuildContext context, Task task) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPage(task)));
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: task.bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(task.iconData, color: task.iconColor, size: 30,),
            const SizedBox(height: 25,),
            Text(task.title!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            const SizedBox(height: 15,),
            Row(
              children: [
                _buildTaskStatus(task.btnColor!, task.iconColor!, '${task.left} left'),
                const SizedBox(width: 5,),
                _buildTaskStatus(Colors.white, task.iconColor!, '${task.done} done')
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTaskStatus(Color bgColor, Color txColor, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: TextStyle(color: txColor),),
    );
  }

}
