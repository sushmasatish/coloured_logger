require 'spec_helper'

describe ColouredLogger do
  it 'has a version number' do
    expect(ColouredLogger::VERSION).not_to be nil
  end

  it 'does log with severity: debug' do
    ColouredLogger::CLogger.debug("LOG_DEBUG", "This is a log with debug severity")
    # No expectation here.
  end

  it 'does log with severity: info' do
    ColouredLogger::CLogger.info("LOG_INFO", "This is a log with info severity")
    # No expectation here.
  end

  it 'does log with severity: warn' do
    ColouredLogger::CLogger.warn("LOG_WARN", "This is a log with warn severity")
    # No expectation here.
  end

  it 'does log with severity: error' do
    ColouredLogger::CLogger.error("LOG_ERROR", "This is a log with error severity")
    # No expectation here.
  end

  it 'does log with severity: fatal' do
    ColouredLogger::CLogger.fatal("LOG_FATAL", "This is a log with fatal severity")
    # No expectation here.
  end

  it 'does log with severity: unknown' do
    ColouredLogger::CLogger.unknown("LOG_UNKNOWN", "This is a log with unknown severity")
    # No expectation here.
  end

  it 'does log time' do
    start_time = Time.now.ago(10.minute)
    ColouredLogger::CLogger.log_time("LOG_TIME", start_time, "to finish a job")
    # No expectation here.
  end
end
