<?php

function build_config_global_from_config_env()
{
  static $value = null;
  if (!is_null($value)) {
    return $value;
  }
  if (!($h = fopen('../config.env', 'r'))) {
    return null;
  }
  $value = [];
  while ($line = trim(fgets($h))) {
    if ($line) {
      $e = explode('=', $line, 2);
      $value[trim($e[0])] = trim($e[1]);
    }
  }
  return $value;
}

$CONFIG = build_config_global_from_config_env();
