classdef tHBox < sharedtests.SharedBoxTests
    %THBOX Tests for uiextras.HBox and uix.HBox.

    properties ( TestParameter )
        % The constructor name, or class, of the component under test.
        ConstructorName = {'uiextras.HBox', 'uix.HBox'}
        % Name-value pair arguments to use when testing the component's
        % constructor and get/set methods.
        NameValuePairs = {{
            'BackgroundColor', [0, 0, 1], ...
            'Units', 'pixels', ...
            'Position', [10, 10, 400, 400], ...
            'Padding', 5, ...
            'Spacing', 5, ...
            'Tag', 'test', ...
            'Visible', 'on', ...
            'Widths', double.empty( 0, 1 ), ...
            'MinimumWidths', double.empty( 0, 1 ), ...
            'Sizes', double.empty( 1, 0 ), ...
            'MinimumSizes', double.empty( 1, 0 )
            }, ...
            {
            'BackgroundColor', [0, 0, 1], ...
            'Units', 'pixels', ...
            'Position', [10, 10, 400, 400], ...
            'Padding', 5, ...
            'Spacing', 5, ...
            'Tag', 'test', ...
            'Visible', 'on', ...
            'Widths', double.empty( 0, 1 ), ...
            'MinimumWidths', double.empty( 0, 1 )
            }}
        % Box dimension name-value pairs used when testing the component's
        % get/set methods.
        BoxDimensionNameValuePairs = {{
            'Widths', [-1, -2, 100, -1], ...
            'Sizes', [-1, -2, 100, -1], ...
            'MinimumWidths', [0, 1, 2, 0], ...
            'MinimumSizes', [0, 1, 2, 0]
            }, ...
            {
            'Widths', [-1, -2, 100, -1], ...
            'MinimumWidths', [0, 1, 2, 0]
            }}
    end % properties ( TestParameter )

end % class