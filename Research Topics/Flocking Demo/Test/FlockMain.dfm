object frmMain: TfrmMain
  Left = 253
  Top = 121
  Width = 800
  Height = 600
  ActiveControl = btnStart
  Caption = 'Flocking Demo    Copyright 2001, Thomas G. Grubb'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  HelpFile = 'FlockDemo.hlp'
  OldCreateOrder = False
  Scaled = False
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Splitter1: TSplitter
    Left = 604
    Top = 0
    Width = 3
    Height = 568
    Cursor = crHSplit
    Align = alRight
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 604
    Height = 568
    Align = alClient
    Caption = 'Flock World'
    TabOrder = 0
    object Chart1: TChart
      Left = 2
      Top = 18
      Width = 600
      Height = 548
      Hint = 
        '2D View of flocks (every arrow of same color is a boid in the sa' +
        'me flock)'
      HelpContext = 12
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Title.Text.Strings = (
        'TChart')
      Title.Visible = False
      BottomAxis.Automatic = False
      BottomAxis.AutomaticMaximum = False
      BottomAxis.AutomaticMinimum = False
      BottomAxis.Maximum = 100
      LeftAxis.Automatic = False
      LeftAxis.AutomaticMaximum = False
      LeftAxis.AutomaticMinimum = False
      LeftAxis.Maximum = 100
      Legend.Visible = False
      View3D = False
      Align = alClient
      TabOrder = 0
      OnMouseMove = Chart1MouseMove
      object Series1: TChartShape
        Marks.ArrowLength = 8
        Marks.Visible = False
        SeriesColor = clWhite
        ShowInLegend = False
        Brush.Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Style = chasRectangle
        X0 = 10
        X1 = 20
        Y0 = 15
        Y1 = 35
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Y'
        YValues.Multiplier = 1
        YValues.Order = loNone
      end
      object Series2: TChartShape
        Marks.ArrowLength = 8
        Marks.Visible = False
        SeriesColor = clWhite
        ShowInLegend = False
        Brush.Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Style = chasCube
        X0 = 40
        X1 = 70
        Y0 = 80
        Y1 = 70
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Y'
        YValues.Multiplier = 1
        YValues.Order = loNone
      end
      object Series3: TChartShape
        Marks.ArrowLength = 8
        Marks.Visible = False
        SeriesColor = clWhite
        ShowInLegend = False
        Brush.Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Style = chasCube
        X0 = 80
        X1 = 85
        Y0 = 15
        Y1 = 10
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Y'
        YValues.Multiplier = 1
        YValues.Order = loNone
      end
      object FlockSeries: TArrowSeries
        Marks.ArrowLength = 0
        Marks.Frame.Visible = False
        Marks.Transparent = True
        Marks.Visible = False
        SeriesColor = clRed
        Title = 'Flock'
        Pointer.InflateMargins = False
        Pointer.Style = psRectangle
        Pointer.Visible = True
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Y'
        YValues.Multiplier = 1
        YValues.Order = loNone
        EndXValues.DateTime = True
        EndXValues.Name = 'EndX'
        EndXValues.Multiplier = 1
        EndXValues.Order = loNone
        EndYValues.DateTime = False
        EndYValues.Name = 'EndY'
        EndYValues.Multiplier = 1
        EndYValues.Order = loNone
        StartXValues.DateTime = False
        StartXValues.Name = 'X'
        StartXValues.Multiplier = 1
        StartXValues.Order = loAscending
        StartYValues.DateTime = False
        StartYValues.Name = 'Y'
        StartYValues.Multiplier = 1
        StartYValues.Order = loNone
      end
    end
  end
  object Panel1: TPanel
    Left = 607
    Top = 0
    Width = 185
    Height = 568
    Align = alRight
    TabOrder = 1
    object GroupBox2: TGroupBox
      Left = 1
      Top = 1
      Width = 183
      Height = 136
      Align = alTop
      Caption = 'Si&mulation'
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 88
        Width = 63
        Height = 32
        Anchors = [akLeft, akTop, akBottom]
        Caption = '&Max Steps / Sec'
        FocusControl = tbMaxStepsPerSec
        WordWrap = True
      end
      object btnOneStep: TButton
        Left = 96
        Top = 24
        Width = 75
        Height = 25
        Hint = 'Take one step in the simulation'
        HelpContext = 20
        Anchors = [akTop, akRight]
        Caption = '&One Step'
        TabOrder = 2
        OnClick = btnOneStepClick
      end
      object btnStart: TButton
        Left = 8
        Top = 24
        Width = 75
        Height = 25
        Hint = 'Start the simulation running'
        HelpContext = 30
        Anchors = [akLeft, akTop, akRight]
        Caption = '&Start'
        Default = True
        TabOrder = 0
        OnClick = btnStartClick
      end
      object btnStop: TButton
        Left = 8
        Top = 56
        Width = 75
        Height = 25
        Hint = 'Stop the simulation'
        HelpContext = 40
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Sto&p'
        Enabled = False
        TabOrder = 1
        OnClick = btnStopClick
      end
      object tbMaxStepsPerSec: TTrackBar
        Left = 72
        Top = 88
        Width = 102
        Height = 25
        Hint = 'Specify the maximum number of steps per second (1-100)'
        HelpContext = 120
        Anchors = [akLeft, akTop, akRight]
        Max = 100
        Min = 1
        Orientation = trHorizontal
        Frequency = 5
        Position = 25
        SelEnd = 0
        SelStart = 0
        TabOrder = 3
        TickMarks = tmBottomRight
        TickStyle = tsAuto
        OnChange = tbMaxStepsPerSecChange
      end
    end
    object GroupBox3: TGroupBox
      Left = 1
      Top = 242
      Width = 183
      Height = 287
      Align = alClient
      Caption = 'Flocking &Behaviors'
      TabOrder = 2
      object Label4: TLabel
        Left = 8
        Top = 121
        Width = 66
        Height = 32
        Anchors = [akLeft, akTop, akBottom]
        Caption = 'Separation Strength'
        FocusControl = tbSeparationStrength
        WordWrap = True
      end
      object Label5: TLabel
        Left = 8
        Top = 161
        Width = 62
        Height = 32
        Anchors = [akLeft, akTop, akBottom]
        Caption = 'Alignment Strength'
        FocusControl = tbAlignmentStrength
        WordWrap = True
      end
      object Label6: TLabel
        Left = 8
        Top = 201
        Width = 57
        Height = 32
        Anchors = [akLeft, akTop, akBottom]
        Caption = 'Cohesion Strength'
        FocusControl = tbCohesionStrength
        WordWrap = True
      end
      object Label7: TLabel
        Left = 8
        Top = 241
        Width = 65
        Height = 32
        Anchors = [akLeft, akTop, akBottom]
        Caption = 'Avoidance Strength'
        FocusControl = tbAvoidanceStrength
        WordWrap = True
      end
      object clbBehaviors: TCheckListBox
        Left = 2
        Top = 18
        Width = 179
        Height = 87
        Hint = 'Specify which flocking behaviors affect the boids'
        HelpContext = 50
        OnClickCheck = clbBehaviorsClickCheck
        Align = alTop
        ItemHeight = 16
        Items.Strings = (
          'Separation'
          'Alignment'
          'Cohesion'
          'Avoidance')
        TabOrder = 0
      end
      object tbSeparationStrength: TTrackBar
        Left = 80
        Top = 120
        Width = 94
        Height = 29
        Hint = 'Specify the separation rule strength'
        HelpContext = 60
        Anchors = [akLeft, akTop, akRight]
        Max = 100
        Orientation = trHorizontal
        ParentShowHint = False
        Frequency = 5
        Position = 100
        SelEnd = 0
        SelStart = 0
        ShowHint = True
        TabOrder = 1
        TickMarks = tmBottomRight
        TickStyle = tsAuto
        OnChange = tbSeparationStrengthChange
      end
      object tbAlignmentStrength: TTrackBar
        Left = 80
        Top = 160
        Width = 94
        Height = 29
        Hint = 'Specify the alignment rule strength'
        HelpContext = 70
        Anchors = [akLeft, akTop, akRight]
        Max = 100
        Orientation = trHorizontal
        ParentShowHint = False
        Frequency = 5
        Position = 100
        SelEnd = 0
        SelStart = 0
        ShowHint = True
        TabOrder = 2
        TickMarks = tmBottomRight
        TickStyle = tsAuto
        OnChange = tbSeparationStrengthChange
      end
      object tbCohesionStrength: TTrackBar
        Left = 80
        Top = 200
        Width = 94
        Height = 29
        Hint = 'Specify the cohesion rule strength'
        HelpContext = 80
        Anchors = [akLeft, akTop, akRight]
        Max = 100
        Orientation = trHorizontal
        ParentShowHint = False
        Frequency = 5
        Position = 100
        SelEnd = 0
        SelStart = 0
        ShowHint = True
        TabOrder = 3
        TickMarks = tmBottomRight
        TickStyle = tsAuto
        OnChange = tbSeparationStrengthChange
      end
      object tbAvoidanceStrength: TTrackBar
        Left = 80
        Top = 240
        Width = 94
        Height = 29
        Hint = 'Specify the avoidance rule strength'
        HelpContext = 90
        Anchors = [akLeft, akTop, akRight]
        Max = 100
        Orientation = trHorizontal
        ParentShowHint = False
        Frequency = 5
        Position = 100
        SelEnd = 0
        SelStart = 0
        ShowHint = True
        TabOrder = 4
        TickMarks = tmBottomRight
        TickStyle = tsAuto
        OnChange = tbSeparationStrengthChange
      end
    end
    object GroupBox4: TGroupBox
      Left = 1
      Top = 137
      Width = 183
      Height = 105
      Align = alTop
      Caption = 'O&ptions'
      TabOrder = 1
      object Label2: TLabel
        Left = 8
        Top = 49
        Width = 62
        Height = 32
        Anchors = [akLeft, akTop, akBottom]
        Caption = '&Boids Per Flock'
        FocusControl = tbBoidsPerFlock
        WordWrap = True
      end
      object Label3: TLabel
        Left = 8
        Top = 17
        Width = 48
        Height = 32
        Anchors = [akLeft, akTop, akBottom]
        Caption = 'Num. of Flocks'
        FocusControl = tbNumFlocks
        WordWrap = True
      end
      object tbBoidsPerFlock: TTrackBar
        Left = 72
        Top = 48
        Width = 102
        Height = 29
        Hint = 'Specify the number of boids in each flock'
        HelpContext = 100
        Anchors = [akLeft, akTop, akRight]
        Max = 100
        Min = 2
        Orientation = trHorizontal
        ParentShowHint = False
        Frequency = 5
        Position = 50
        SelEnd = 0
        SelStart = 0
        ShowHint = True
        TabOrder = 1
        TickMarks = tmBottomRight
        TickStyle = tsAuto
        OnChange = tbBoidsPerFlockChange
      end
      object tbNumFlocks: TTrackBar
        Left = 72
        Top = 16
        Width = 102
        Height = 29
        Hint = 
          'Specify the number of flocks (every flock is considered an enemy' +
          ')'
        HelpContext = 110
        Anchors = [akLeft, akTop, akRight]
        Min = 1
        Orientation = trHorizontal
        ParentShowHint = False
        Frequency = 1
        Position = 2
        SelEnd = 0
        SelStart = 0
        ShowHint = True
        TabOrder = 0
        TickMarks = tmBottomRight
        TickStyle = tsAuto
        OnChange = tbNumFlocksChange
      end
      object cbFollowMouse: TCheckBox
        Left = 8
        Top = 80
        Width = 169
        Height = 17
        Hint = 
          'Turn this option on to have the FIRST flock try to follow mouse ' +
          '(Note, you may have to turn down separation, alignment, and avoi' +
          'dance to see this better)'
        HelpContext = 130
        Anchors = [akLeft, akRight, akBottom]
        Caption = '&Follow Mouse'
        TabOrder = 2
        OnClick = cbFollowMouseClick
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 529
      Width = 183
      Height = 38
      Align = alBottom
      TabOrder = 3
      object BitBtn1: TBitBtn
        Left = 46
        Top = 7
        Width = 91
        Height = 25
        HelpContext = 10
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Kind = bkHelp
      end
    end
  end
  object World: TFlockWorld
    Dimension.X = 100
    Dimension.Y = 100
    Dimension.Z = 100
    Gravity = 9.80665016174316
    Left = 10
    Top = 26
  end
  object ProtoFlock: TFlock
    Boids = <>
    Behaviors = [fbSeparation, fbAlignment, fbCohesion, fbAvoidance]
    MaxChange = 0.100000001490116
    MaxSpeed = 1
    MaxUrgency = 0.100000001490116
    MinUrgency = 0.0500000007450581
    OnApplyAvoidance = ProtoFlockApplyAvoidance
    OnChange = ProtoFlockChange
    AvoidanceDistance = 6
    SeparationDistance = 3
    StrengthAlignment = 1
    StrengthAvoidance = 1
    StrengthSeparation = 1
    StrengthCohesion = 1
    Left = 42
    Top = 26
  end
end
