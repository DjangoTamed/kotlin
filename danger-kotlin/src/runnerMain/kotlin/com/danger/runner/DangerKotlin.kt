package com.danger.runner

import com.danger.runner.cmd.*
import com.danger.runner.cmd.dangerfile.DangerFile

object DangerKotlin {
    private const val FILE_TMP_OUTPUT_JSON = "danger_out.json"

    fun run() {
        val dangerDSLPath = readLine()
        dangerDSLPath?.removePrefix("danger://dsl/")?.let {
            with(DangerFile) {
                execute(it, FILE_TMP_OUTPUT_JSON)
            }

            printResult()
        }
    }

    private fun printResult() {
        //TODO: find proper way to print the result in the stdout
        Cmd().name("echo").args("danger-results:/`pwd`/$FILE_TMP_OUTPUT_JSON").exec(false)
    }
}