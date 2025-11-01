import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:你的项目名称/main.dart'; // 确保导入路径正确

void main() {
  testWidgets('Todo app smoke test', (WidgetTester tester) async {
    // 构建待办应用
    await tester.pumpWidget(const MyApp());

    // 验证应用标题
    expect(find.text('待办事项'), findsOneWidget);
    
    // 验证输入框存在
    expect(find.byType(TextField), findsOneWidget);
    expect(find.hintText('输入新任务...'), findsOneWidget);
    
    // 验证添加按钮存在
    expect(find.byIcon(Icons.add), findsOneWidget);
  });

  testWidgets('Add todo item test', (WidgetTester tester) async {
    // 构建应用
    await tester.pumpWidget(const MyApp());

    // 在输入框中输入文本
    await tester.enterText(find.byType(TextField), '测试任务');
    
    // 点击添加按钮
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // 验证任务已添加到列表
    expect(find.text('测试任务'), findsOneWidget);
    
    // 验证复选框存在
    expect(find.byType(Checkbox), findsOneWidget);
  });

  testWidgets('Complete todo item test', (WidgetTester tester) async {
    // 构建应用
    await tester.pumpWidget(const MyApp());

    // 添加一个任务
    await tester.enterText(find.byType(TextField), '完成任务测试');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // 点击复选框完成任务
    await tester.tap(find.byType(Checkbox));
    await tester.pump();

    // 验证任务有删除线样式（可选，如果需要可以添加）
    // 这里我们至少验证任务仍然存在
    expect(find.text('完成任务测试'), findsOneWidget);
  });
}