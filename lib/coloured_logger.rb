require 'singleton'
require 'active_support/all'
require 'coloured_logger/version'
require 'coloured_logger/logger'

module ColouredLogger
  class CLogger
    include Singleton

    attr_reader :logger

    SEVERITY_TO_COLOR_MAP = {'DEBUG'=>'36', 'INFO'=>'32', 'WARN'=>'33', 'ERROR'=>'31', 'FATAL'=>'31', 'UNKNOWN'=>'37', 'PERF'=>'35'}
    SEVERITY_TO_BACKGROUND_COLOR_MAP = {'DEBUG'=>'0', 'INFO'=>'0', 'WARN'=>'0', 'ERROR'=>'0', 'FATAL'=>'103', 'UNKNOWN'=>'0', 'PERF'=>'0'}

      def initialize
      @logger = Logger.new(STDOUT)
      # Logger.LEVEL = DEBUG - logs all levels, INFO - would not log debug level.
      @logger.level = Logger::DEBUG
      @logger.formatter = proc do |severity, time, progname, msg|
            formatted_severity = sprintf("%-5s",severity.to_s)
            formatted_time = sprintf("[%s]", time.strftime("%Y-%m-%d %H:%M:%S"))
            date_color ='1;34'
            severity_color = SEVERITY_TO_COLOR_MAP[severity]
            background_color = SEVERITY_TO_BACKGROUND_COLOR_MAP[severity]
            "\033[#{date_color}m#{formatted_time} \033[#{background_color};#{severity_color}m#{formatted_severity}\033[0m-- #{msg.to_s.strip}\n"
        end
    end

    def formatted_method(method)
      sprintf("%-20s", method)
    end

    # low-level information for developers
    def self.debug(method, message)
      formatted_method = CLogger.instance.formatted_method(method)
      CLogger.instance.logger.debug("#{formatted_method}: #{message}")
    end

    # generic (useful) information about system operation
    def self.info(method, message)
      formatted_method = CLogger.instance.formatted_method(method)
      CLogger.instance.logger.info("#{formatted_method}: #{message}")
    end

    def self.warn(method, message)
      formatted_method = CLogger.instance.formatted_method(method)
      CLogger.instance.logger.warn("#{formatted_method}: #{message}")
    end

    def self.error(method, message)
      formatted_method = CLogger.instance.formatted_method(method)
      CLogger.instance.logger.error("#{formatted_method}: #{message}")
    end

    def self.fatal(method, message)
      formatted_method = CLogger.instance.formatted_method(method)
      CLogger.instance.logger.fatal("#{formatted_method}: #{message}")
    end

    def self.unknown(method, message)
      formatted_method = CLogger.instance.formatted_method(method)
      CLogger.instance.logger.unknown("#{formatted_method}: #{message}")
    end

    # Logs time taken to execute a task
    def self.log_time(method, start_time, task_name)
      end_time = Time.now
      formatted_method = CLogger.instance.formatted_method(method)
      time_taken = end_time - start_time
      formatted_time_taken = sprintf("[%.4f sec]", time_taken)
      CLogger.instance.logger.perf("#{formatted_method}: Time taken to #{task_name} - \033[35m#{formatted_time_taken}\033[0m")
    end
  end
end
