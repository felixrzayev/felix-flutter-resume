import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

DataModel dataFromJson(String str) => DataModel.fromJson(json.decode(str));

class DataModel {
  DataModel({
    required this.name,
    required this.subtitle,
    required this.phoneNumber,
    required this.email,
    required this.location,
    required this.instagram,
    required this.twitter,
    required this.linkedIn,
    required this.github,
    required this.telegran,
    required this.about,
    required this.education,
    required this.languages,
    required this.certification,
    required this.skills,
    required this.experience,
  });

  String name;
  String subtitle;
  String phoneNumber;
  String email;
  String location;
  String instagram;
  String twitter;
  String linkedIn;
  String github;
  String telegran;
  About about;
  List<Education> education;
  List<Language> languages;
  List<Certification> certification;
  List<String> skills;
  List<Experience> experience;

  //----------------------------------------------------------------------------

  factory DataModel.fromSnapshot(DataSnapshot ds) => DataModel(
        name: ds.child("name").value.toString(),
        subtitle: ds.child("subtitle").value.toString(),
        phoneNumber: ds.child("phoneNumber").value.toString(),
        email: ds.child("email").value.toString(),
        location: ds.child("location").value.toString(),
        instagram: ds.child("instagram").value.toString(),
        twitter: ds.child("twitter").value.toString(),
        linkedIn: ds.child("linkedIn").value.toString(),
        github: ds.child("github").value.toString(),
        telegran: ds.child("telegran").value.toString(),
        about: About.fromSnapshot(ds),
        education: List<Education>.from(
          ds.child("education").children.map(
                (x) => Education.fromSnapshot(x),
              ),
        ),
        languages: List<Language>.from(ds
            .child('languages')
            .children
            .map((x) => Language.fromSnapshot(x))),
        certification: List<Certification>.from(
          ds.child("certification").children.map(
                (x) => Certification.fromSnapshot(x),
              ),
        ),
        skills: List<String>.from(ds.child('skills').children.map(
              (x) => x.value.toString(),
            )),
        experience: List<Experience>.from(
          ds.child('experience').children.map(
                (x) => Experience.fromSnapshot(x),
              ),
        ),
      );

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        about: About.fromJson(json["about"]),
        name: json["name"],
        subtitle: json["subtitle"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        location: json["location"],
        instagram: json["instagram"],
        twitter: json["twitter"],
        linkedIn: json["linkedIn"],
        github: json["github"],
        telegran: json["telegran"],
        education: List<Education>.from(
            json["education"].map((x) => Education.fromJson(x))),
        languages: List<Language>.from(
            json["languages"].map((x) => Language.fromJson(x))),
        certification: List<Certification>.from(
            json["certification"].map((x) => Certification.fromJson(x))),
        skills: List<String>.from(json["skills"].map((x) => x)),
        experience: List<Experience>.from(
            json["experience"].map((x) => Experience.fromJson(x))),
      );
}

//------------------------------------------------------------------------------

class About {
  About({
    required this.into,
    required this.highlights,
  });

  String into;
  List<String> highlights;

  factory About.fromJson(Map<String, dynamic> json) => About(
        highlights: List<String>.from(json["highlights"].map((x) => x)),
        into: json["into"],
      );

  factory About.fromSnapshot(DataSnapshot ds) => About(
        into: ds.child('about/into').value.toString(),
        highlights: List<String>.from(ds
            .child('about/highlights')
            .children
            .map((x) => x.value.toString())),
      );
}

//------------------------------------------------------------------------------

class Certification {
  Certification({
    required this.institution,
    required this.title,
    required this.date,
  });

  String institution;
  String title;
  String date;

  factory Certification.fromJson(Map<String, dynamic> json) => Certification(
        institution: json["institution"],
        title: json["title"],
        date: json["date"],
      );

  factory Certification.fromSnapshot(DataSnapshot ds) => Certification(
        institution: ds.child('institution').value.toString(),
        title: ds.child('title').value.toString(),
        date: ds.child('date').value.toString(),
      );
}

//------------------------------------------------------------------------------

class Education {
  Education({
    required this.degree,
    required this.image,
    required this.university,
    required this.location,
    required this.startDate,
    required this.endDate,
  });

  String degree;
  String image;
  String university;
  String location;
  String startDate;
  String endDate;

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        degree: json["degree"],
        image: json["image"],
        university: json["university"],
        location: json["location"],
        startDate: json["startDate"],
        endDate: json["endDate"],
      );

  factory Education.fromSnapshot(DataSnapshot ds) => Education(
        degree: ds.child("degree").value.toString(),
        image: ds.child("image").value.toString(),
        university: ds.child("university").value.toString(),
        location: ds.child("location").value.toString(),
        startDate: ds.child("startDate").value.toString(),
        endDate: ds.child("endDate").value.toString(),
      );
}

//------------------------------------------------------------------------------

class Experience {
  Experience({
    required this.company,
    required this.title,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.highlights,
  });

  String company;
  String title;
  String location;
  String startDate;
  String endDate;
  List<String> highlights;

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        company: json["company"],
        title: json["title"],
        location: json["location"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        highlights: List<String>.from(json["highlights"].map((x) => x)),
      );

  factory Experience.fromSnapshot(DataSnapshot ds) => Experience(
        company: ds.child('company').value.toString(),
        title: ds.child('title').value.toString(),
        location: ds.child('locationn').value.toString(),
        startDate: ds.child('startDate').value.toString(),
        endDate: ds.child('endDate').value.toString(),
        highlights: List<String>.from(
          ds.child('highlights').children.map(
                (x) => x.value.toString(),
              ),
        ),
      );
}

//------------------------------------------------------------------------------

class Language {
  Language({
    required this.language,
    required this.level,
  });

  String language;
  String level;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        language: json["language"],
        level: json["level"],
      );

  factory Language.fromSnapshot(DataSnapshot ds) => Language(
        language: ds.child('language').value.toString(),
        level: ds.child('level').value.toString(),
      );
}
