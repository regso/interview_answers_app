import 'package:interview_answers_app/features/subjects/data/data_sources/local_subject_icon_data_source.dart';
import 'package:interview_answers_app/features/subjects/data/data_sources/remote_subject_data_source.dart';
import 'package:interview_answers_app/features/subjects/domain/entities/subject_entity.dart';
import 'package:interview_answers_app/features/subjects/domain/repositories/abstract_subject_repository.dart';

class SubjectRepository implements AbstractSubjectRepository {
  final RemoteSubjectDataSource remoteSubjectDataSource;
  final LocalSubjectIconDataSource localSubjectIconDataSource;

  SubjectRepository({
    required this.remoteSubjectDataSource,
    required this.localSubjectIconDataSource,
  });

  @override
  Future<List<SubjectEntity>> findSubjects() async {
    final iconBySubjectIdMap =
        await localSubjectIconDataSource.getIconBySubjectIdMap();
    final items = await remoteSubjectDataSource.findSubjects();
    return items
        .map(
          (final item) => SubjectEntity(
            id: item['id'],
            title: item['title'],
            icon: iconBySubjectIdMap[item['id']]!,
          ),
        )
        .toList();
  }
}
