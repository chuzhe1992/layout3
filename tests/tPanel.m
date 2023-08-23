classdef tPanel < sharedtests.SharedPanelTests
    %TPANEL Tests for uiextras.Panel and uix.Panel.

    properties ( TestParameter )
        % The constructor name, or class, of the component under test.
        ConstructorName = {'uiextras.Panel', 'uix.Panel'}
        % Name-value pair arguments to use when testing the component's
        % constructor and get/set methods.
        NameValuePairs = {tPanel.CommonNameValuePairs, ...
            tPanel.CommonNameValuePairs}
    end % properties ( TestParameter )

    properties ( Constant )
        % Name-value pairs common to both uiextras.Panel and uix.Panel.
        CommonNameValuePairs = {
            'BackgroundColor', [1, 1, 0], ...
            'BorderType', 'line', ...
            'ButtonDownFcn', @glttestutilities.noop, ...
            'CreateFcn', @glttestutilities.noop, ...
            'ContextMenu', [], ...
            'DeleteFcn', @glttestutilities.noop, ...
            'Enable', 'on', ...
            'FontAngle', 'normal', ...
            'FontName', 'SansSerif', ...
            'FontSize', 20, ...
            'FontUnits', 'points', ...
            'FontWeight', 'bold', ...
            'ForegroundColor', [0, 0, 0], ...
            'HighlightColor', [1, 1, 1], ...
            'HandleVisibility', 'on', ...
            'Padding', 5, ...
            'Tag', 'Test', ...
            'Units', 'pixels', ...
            'Position', [10, 10, 400, 400], ...
            'Visible', 'on'
            }
    end % properties ( Constant )

end % class