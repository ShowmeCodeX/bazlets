load("//tools:maven_jar.bzl", "maven_jar")
load("//:bouncycastle.bzl", "bouncycastle_repos")

"""Bazel rule for building [Gerrit Code Review](https://www.gerritcodereview.com/)
gerrit_api is rule for fetching Gerrit plugin API using Bazel.
"""

VER = "2.16.1"

def gerrit_api():
    bouncycastle_repos()

    maven_jar(
        name = "gerrit_plugin_api",
        artifact = "com.google.gerrit:gerrit-plugin-api:" + VER,
        sha1 = "b9e8b11cc91bdabcee820eb5936b04bbe14cab02",
    )
    maven_jar(
        name = "gerrit_plugin_gwtui",
        artifact = "com.google.gerrit:gerrit-plugin-gwtui:" + VER,
        sha1 = "3788ce7294f4cfd8496a8ac29c952b9606123e83",
        exclude = ["com/google/gwt/*"],
    )
    maven_jar(
        name = "gerrit_acceptance_framework",
        artifact = "com.google.gerrit:gerrit-acceptance-framework:" + VER,
        sha1 = "fc1bf69d6a21bd29bd67cab75bef27c27d730856",
    )
    native.bind(
        name = "gerrit-plugin-api",
        actual = "@gerrit_plugin_api//jar",
    )
    native.bind(
        name = "gerrit-plugin-gwtui",
        actual = "@gerrit_plugin_gwtui//jar",
    )
    native.bind(
        name = "gerrit-acceptance-framework",
        actual = "@gerrit_acceptance_framework//jar",
    )
    native.bind(
        name = "gerrit-plugin-api-neverlink",
        actual = "@gerrit_plugin_api//jar:neverlink",
    )
    native.bind(
        name = "gerrit-plugin-gwtui-neverlink",
        actual = "@gerrit_plugin_gwtui//jar:neverlink",
    )
    native.bind(
        name = "gerrit-acceptance-framework-neverlink",
        actual = "@gerrit_acceptance_framework//jar:neverlink",
    )
