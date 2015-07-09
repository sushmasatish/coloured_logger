require 'spec_helper'

describe ColoredLogger do
  it 'has a version number' do
    expect(ColoredLogger::VERSION).not_to be nil
  end

  it 'does log with severity: debug' do
    ColoredLogger::CLogger.debug("LOG_DEBUG", "This is a log with debug severity")
    # No expectation here.
  end

  it 'does log with severity: info' do
    ColoredLogger::CLogger.info("LOG_INFO", "This is a log with info severity")
    # No expectation here.
  end

  it 'does log with severity: warn' do
    ColoredLogger::CLogger.warn("LOG_WARN", "This is a log with warn severity")
    # No expectation here.
  end

  it 'does log with severity: error' do
    ColoredLogger::CLogger.error("LOG_ERROR", "This is a log with error severity")
    # No expectation here.
  end

  it 'does log with severity: fatal' do
    ColoredLogger::CLogger.fatal("LOG_FATAL", "This is a log with fatal severity")
    # No expectation here.
  end

  it 'does log with severity: unknown' do
    ColoredLogger::CLogger.unknown("LOG_UNKNOWN", "This is a log with unknown severity")
    # No expectation here.
  end

  it 'does log time' do
    start_time = Time.now.ago(10.minute)
    ColoredLogger::CLogger.log_time("LOG_TIME", start_time, "to finish a job")
    # No expectation here.
  end
end
