classdef tGridFlex < sharedtests.SharedGridTests & ...
        sharedtests.SharedFlexTests
    %TGRIDFLEX Tests for uiextras.GridFlex and uix.GridFlex.

    properties ( TestParameter )
        % The constructor name, or class, of the component under test.
        ConstructorName = {'uiextras.GridFlex', 'uix.GridFlex'}
        % Name-value pair arguments to use when testing the component's
        % constructor and get/set methods.
        NameValuePairs = {{
            'BackgroundColor', [0, 0, 1], ...
            'Units', 'pixels', ...
            'Position', [10, 10, 400, 400], ...
            'Padding', 5, ...
            'ShowMarkings', 'off', ...
            'DividerMarkings', 'off', ...
            'Spacing', 5, ...
            'Tag', 'test' ...
            'Visible', 'on', ...
            'RowSizes', double.empty( 0, 1 ), ...
            'ColumnSizes', double.empty( 0, 1 ), ...
            'MinimumRowSizes', double.empty( 0, 1 ), ...
            'MinimumColumnSizes', double.empty( 0, 1 ), ...
            'Widths', double.empty( 0, 1 ), ...
            'Heights', double.empty( 0, 1 ), ...
            'MinimumWidths', double.empty( 0, 1 ), ...
            'MinimumHeights', double.empty( 0, 1 )
            }, ...
            {
            'BackgroundColor', [0, 0, 1], ...
            'Units', 'pixels', ...
            'Position', [10, 10, 400, 400], ...
            'Padding', 5, ...
            'DividerMarkings', 'off', ...
            'Spacing', 5, ...
            'Tag', 'test' ...
            'Visible', 'on', ...
            'Widths', double.empty( 0, 1 ), ...
            'Heights', double.empty( 0, 1 ), ...
            'MinimumWidths', double.empty( 0, 1 ), ...
            'MinimumHeights', double.empty( 0, 1 )
            }}
        % Grid dimension name-value pairs used when testing the component's
        % get/set methods.
        GridDimensionNameValuePairs = {{
            'RowSizes', [-10, -1, 20], ...
            'ColumnSizes', [-0.5, 50], ...
            'MinimumRowSizes', [2, 2, 2], ...
            'MinimumColumnSizes', [2, 2], ...
            'Heights', [-10, -1, 20], ...
            'Widths', [-0.5, 50], ...
            'MinimumHeights', [2, 2, 2], ...
            'MinimumWidths', [2, 2]
            }, ...
            {
            'Heights', [-10, -1, 20], ...
            'Widths', [-0.5, 50], ...
            'MinimumHeights', [2, 2, 2], ...
            'MinimumWidths', [2, 2]
            }}
    end % properties ( TestParameter )

    methods ( Test, Sealed )

        function tDraggingRowDividerIsWarningFree( ...
                testCase, ConstructorName, ChildrenSizes )

            % Assume that the graphics are rooted.
            testCase.assumeGraphicsAreRooted()

            % Create a component.
            component = testCase.constructComponent( ConstructorName, ...
                'Spacing', 10 );

            % Add children.
            for child = 1 : 4
                uicontrol( component )
            end % for

            % Create a 2-by-2 grid.
            component.Widths = [-1, -1];

            % Identify the dividers.
            c = hgGetTrueChildren( component );
            d = findobj( c, 'Tag', 'uix.Divider', 'Visible', 'on' );

            % Wait until the figure renders.
            testFig = ancestor( component, 'figure' );
            testFig.WindowStyle = 'normal';
            isuifigure = isempty( get( testFig, 'JavaFrame_I' ) );
            if isuifigure
                pause( 5 )
            else
                pause( 1 )
            end % if

            % Test the drag operation for different row heights.
            dragOffsets = {[0, 10], [0, -10]};
            component.Heights = ChildrenSizes;

            % Obtain a reference to the graphics root, for moving the mouse
            % pointer.
            r = groot();

            % Drag the divider in both directions.
            for offset = dragOffsets
                % Move the mouse pointer.                
                r.PointerLocation = testFig.Position(1:2) + ...
                    d(1).Position(1:2) + d(1).Position(3:4)/2;
                drawnow()
                testCase.verifyWarningFree( ...
                    @() dragger( offset{1} ), ...
                    ['Dragging a divider in the ', ConstructorName, ...
                    ' component was not warning-free.'] )
                pause( 0.5 )
            end % for

            function dragger( offset )

                % Simulate a click and drag operation on the divider.

                % Create the robot.
                bot = java.awt.Robot();

                % Click.
                bot.mousePress( java.awt.event.InputEvent.BUTTON1_MASK );
                pause( 0.5 )

                % Drag.
                for k = 1 : 10
                    pointerLoc = r.PointerLocation;
                    r.PointerLocation = pointerLoc + offset;
                    pause( 0.05 )
                end % for

                % Let go.
                bot.mouseRelease( java.awt.event.InputEvent.BUTTON1_MASK );

            end % dragger

        end % tDraggingRowDividerIsWarningFree

    end % methods ( Test, Sealed )

end % class