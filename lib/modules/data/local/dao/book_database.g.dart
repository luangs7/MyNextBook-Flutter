// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorBookDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$BookDatabaseBuilder databaseBuilder(String name) =>
      _$BookDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$BookDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$BookDatabaseBuilder(null);
}

class _$BookDatabaseBuilder {
  _$BookDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$BookDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$BookDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<BookDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$BookDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$BookDatabase extends BookDatabase {
  _$BookDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  BookDao? _bookDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `BookEntity` (`id` TEXT NOT NULL, `title` TEXT NOT NULL, `subtitle` TEXT NOT NULL, `description` TEXT NOT NULL, `previewLink` TEXT, `image` TEXT, `userId` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  BookDao get bookDao {
    return _bookDaoInstance ??= _$BookDao(database, changeListener);
  }
}

class _$BookDao extends BookDao {
  _$BookDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _bookEntityInsertionAdapter = InsertionAdapter(
            database,
            'BookEntity',
            (BookEntity item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'subtitle': item.subtitle,
                  'description': item.description,
                  'previewLink': item.previewLink,
                  'image': item.image,
                  'userId': item.userId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<BookEntity> _bookEntityInsertionAdapter;

  @override
  Future<BookEntity?> getFavoritesById(
    String bookId,
    String userId,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM BookEntity WHERE id = ?1 AND userId = ?2',
        mapper: (Map<String, Object?> row) => BookEntity(
            id: row['id'] as String,
            title: row['title'] as String,
            subtitle: row['subtitle'] as String,
            description: row['description'] as String,
            previewLink: row['previewLink'] as String?,
            image: row['image'] as String?,
            userId: row['userId'] as String),
        arguments: [bookId, userId]);
  }

  @override
  Future<List<BookEntity>> getFavorites(String userId) async {
    return _queryAdapter.queryList('SELECT * FROM BookEntity where userId = ?1',
        mapper: (Map<String, Object?> row) => BookEntity(
            id: row['id'] as String,
            title: row['title'] as String,
            subtitle: row['subtitle'] as String,
            description: row['description'] as String,
            previewLink: row['previewLink'] as String?,
            image: row['image'] as String?,
            userId: row['userId'] as String),
        arguments: [userId]);
  }

  @override
  Future<void> delete(
    String bookId,
    String userId,
  ) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM BookEntity WHERE id=?1 && userId = ?2',
        arguments: [bookId, userId]);
  }

  @override
  Future<void> insertBook(BookEntity book) async {
    await _bookEntityInsertionAdapter.insert(book, OnConflictStrategy.abort);
  }
}

// ignore_for_file: unused_element
final _stringConverter = StringConverter();
