<?php
namespace config;

$V = null;

function get() {
  if (is_null($V)) {
    $h = fopen('../config.env', 'r');
    if ($h) {
      $V = [];
      while ($line = fgets($h)) {
        if ($line) {
          $e = explode('=', $line, 2);
          $V[trim($e[0])] = trim($e[1]);
        }
      }
    }
  }
  return $V;
}
