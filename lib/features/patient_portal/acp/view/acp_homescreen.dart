import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CarePlanningLandingPage extends StatefulWidget {
  const CarePlanningLandingPage({super.key});

  @override
  State<CarePlanningLandingPage> createState() => _CarePlanningLandingPageState();
}

class _CarePlanningLandingPageState extends State<CarePlanningLandingPage> {
  final List<FormSection> sections = [
    FormSection(
      title: "Personal Values & Activities",
      icon: Icons.person_outline,
      questions: [
        Question(
          text: "What activities are important to you?",
          hint: "Social Interaction, Exercise, etc.",
        ),
        Question(
          text: "Could you tell me about your current health status?",
          hint: "Current symptoms, conditions, etc.",
        ),
      ],
    ),
    FormSection(
      title: "Health Concerns & Preferences",
      icon: Icons.medical_services_outlined,
      questions: [
        Question(
          text: "What are your main concerns regarding your health and care?",
          hint: "Pain control, independence, etc.",
        ),
        Question(
          text: "What are your views on life and health?",
          hint: "Your personal philosophy",
        ),
      ],
    ),
    FormSection(
      title: "Treatment Preferences",
      icon: Icons.local_hospital_outlined,
      questions: [
        Question(
          text: "What are your preferences for full treatment?",
          hint: "Limited treatment, comfort-focused, etc.",
        ),
        Question(
          text: "What are your views on end-of-life care?",
          hint: "Pursue life-prolonging treatments, etc.",
        ),
      ],
    ),
    FormSection(
      title: "Decision Making",
      icon: Icons.people_outline,
      questions: [
        Question(
          text: "Who would you like to nominate as your spokesperson for health decisions?",
          hint: "Name and relationship",
        ),
        Question(
          text: "What are your preferred care options within the community?",
          hint: "Home care, assisted living, etc.",
        ),
      ],
    ),
    FormSection(
      title: "End-of-Life Care",
      icon: Icons.health_and_safety_outlined,
      questions: [
        Question(
          text: "Care Options at the End-of-Life",
          hint: "Hospice, hospital, etc.",
        ),
        Question(
          text: "What are your preferences for end-of-life care?",
          hint: "Comfort-focused, spiritual care, etc.",
        ),
        Question(
          text: "What are the next steps you would like to take in your care plan?",
          hint: "Specific actions or plans",
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced Care Planning'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () => _showHelpDialog(context),
          ),
        ],
      ),
      body: Column(
        children: [

          // Form content
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, ),
              children: [
                const Text(
                  "Your Care Preferences",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: Colors.blueGrey,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Please provide detailed responses to each question",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[600],
                  ),
                ),

                // Form sections
                ...sections.map((section) => _buildSection(section, theme, colors)).toList(),

                const SizedBox(height: 32),

                // Submit button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ElevatedButton(
                    onPressed: () => _submitForm(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 2,
                    ),
                    child: const Text(
                      "SUBMIT CARE PLAN",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(FormSection section, ThemeData theme, ColorScheme colors) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: colors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20,),
            decoration: BoxDecoration(
              color: colors.primary.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Icon(section.icon, color: colors.primary),
                const SizedBox(width: 12),
                Text(
                  section.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: colors.primary,
                  ),
                ),
              ],
            ),
          ),

          // Questions with text fields
          ...section.questions.map((question) => _buildQuestionField(question, theme, colors)).toList(),
        ],
      ),
    );
  }

  Widget _buildQuestionField(Question question, ThemeData theme, ColorScheme colors) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 12),

          TextFormField(
            controller: question.controller,
            maxLines: 4,
            minLines: 3,
            decoration: InputDecoration(
              hintText: question.hint,
              filled: true,
              fillColor: colors.surfaceVariant.withOpacity(0.3),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: colors.outline.withOpacity(0.3)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: colors.outline.withOpacity(0.3)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: colors.primary, width: 1.5),
              ),
              contentPadding: const EdgeInsets.all(16),
            ),
            onChanged: (value) => question.response = value,
          ),
        ],
      ),
    );
  }

  void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Form Assistance"),
        content: const Text(
          "Please provide thoughtful responses to each question. "
              "Your answers will help healthcare providers understand your preferences "
              "for current and future medical care.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("GOT IT"),
          ),
        ],
      ),
    );
  }

  void _submitForm(BuildContext context) {
    // Validate responses
    bool allAnswered = true;
    for (var section in sections) {
      for (var question in section.questions) {
        if (question.response.isEmpty) {
          allAnswered = false;
          break;
        }
      }
    }

    if (!allAnswered) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Incomplete Form"),
          content: const Text("Please complete all questions before submitting."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 12),
            Text("Care Plan Submitted"),
          ],
        ),
        content: const Text(
          "Your advanced care planning preferences have been successfully saved. "
              "You can review or update them anytime in your profile.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("DONE"),
          ),
        ],
      ),
    );
  }
}

class FormSection {
  final String title;
  final IconData icon;
  final List<Question> questions;

  FormSection({
    required this.title,
    required this.icon,
    required this.questions,
  });
}

class Question {
  final String text;
  final String hint;
  String response = "";
  late TextEditingController controller;

  Question({
    required this.text,
    required this.hint,
  }) {
    controller = TextEditingController();
  }
}