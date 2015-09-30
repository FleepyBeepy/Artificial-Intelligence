//=== File Prolog ============================================================
//	This code was developed by RiverSoftAVG.
//
//--- Notes ------------------------------------------------------------------
//
//    This flocking demo borrows concepts and algorithms from Steven Woodcock's
//    article, "Flocking: A Simple Technique for Simulating Group Behavior,"
//    which is found in the book, Game Programming Gems
//
//--- Development History  ---------------------------------------------------
//
//      03/2001    T. Grubb
//                 - Added ProtoFlock TFlock instance, holds default flock
//                   parameters for when flocks are created.  Also allows
//                   design-time specification of flock properties
//                 - Changed TFlockWorld instance to design-time
//                 - Added Shapes to avoid!!!  Shapes must be the first series
//                   in the TChart.  This application resets the change to move
//                   directly away from the shape... to be more realistic,
//                   the boid should probably move along the wall of the
//                   shape
//                 - Set Chart dimensions based on TFlockWorld dimensions at
//                   form creation
//	01/27/2001 T. Grubb
//		   - Added "Follow Mouse" checkbox.  If this checkbox is checked,
//                   the first flock will NOT automatically calculate its position,
//                   but will follow the mouse cursor.  Note that the Separation,
//                   Alignment, and Avoidance flocking rules' strengths need to
//                   be turned down to really see this 
//                 - Changed TFlock.Update to use AutoCalcProperties
//	01/2001	   T. Grubb
//		   Initial version.
//
//      File Contents:
//           Main Test Application for Flocking
//
//--- Warning ----------------------------------------------------------------
//	This software is property of RiverSoftAVG. Unauthorized use or
//      duplication of this software is strictly prohibited. Authorized users
//      are subject to the following restrictions:
//	*	RiverSoftAVG is not responsible for
//		any consequence of the use of this software.
//	*	The origin of this software must not be misrepresented either by
//		explicit claim or by omission.
//	*	Altered versions of this software must be plainly marked as such.
//	*	This notice may not be removed or altered.
//
//      This software is freeware.  You are authorized to duplicate and modify
//      this software subject to the restrictions above.
//
//=== End File Prolog ========================================================
unit FlockMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TeEngine, Series, ArrowCha, ExtCtrls, TeeProcs, Chart, StdCtrls,
  Flock, CheckLst, ComCtrls, Buttons, TeeShape, Vector;

type
  TfrmMain = class(TForm)
    GroupBox1: TGroupBox;
    Chart1: TChart;
    FlockSeries: TArrowSeries;
    Panel1: TPanel;
    Splitter1: TSplitter;
    GroupBox2: TGroupBox;
    btnOneStep: TButton;
    btnStart: TButton;
    btnStop: TButton;
    GroupBox3: TGroupBox;
    clbBehaviors: TCheckListBox;
    tbMaxStepsPerSec: TTrackBar;
    Label1: TLabel;
    GroupBox4: TGroupBox;
    tbBoidsPerFlock: TTrackBar;
    Label2: TLabel;
    tbNumFlocks: TTrackBar;
    Label3: TLabel;
    tbSeparationStrength: TTrackBar;
    Label4: TLabel;
    tbAlignmentStrength: TTrackBar;
    Label5: TLabel;
    tbCohesionStrength: TTrackBar;
    Label6: TLabel;
    tbAvoidanceStrength: TTrackBar;
    Label7: TLabel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    cbFollowMouse: TCheckBox;
    World: TFlockWorld;
    ProtoFlock: TFlock;
    Series1: TChartShape;
    Series2: TChartShape;
    Series3: TChartShape;
    procedure FormCreate(Sender: TObject);
    procedure btnOneStepClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure clbBehaviorsClickCheck(Sender: TObject);
    procedure tbMaxStepsPerSecChange(Sender: TObject);
    procedure tbBoidsPerFlockChange(Sender: TObject);
    procedure tbNumFlocksChange(Sender: TObject);
    procedure tbSeparationStrengthChange(Sender: TObject);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cbFollowMouseClick(Sender: TObject);
    procedure ProtoFlockChange(Sender: TObject);
    procedure ProtoFlockApplyAvoidance(Sender: TObject; const Boid: TBoid;
      const Accumulator, Change: TVector);
  private
    { Private declarations }
    FMaxTimeOfStep: Double;
    FSimulate: Boolean;
    FNumShapes: Integer;
    procedure CreateFlock;
    procedure UpdateFlock;
    property MaxTimeOfStep: Double read FMaxTimeOfStep;
  public
    { Public declarations }
    property Simulate: Boolean read FSimulate;
    property NumShapes: Integer read FNumShapes;
  end;

var
  frmMain: TfrmMain;

implementation

uses
    MMSystem, Math;
    
{$R *.DFM}

procedure TfrmMain.FormCreate(Sender: TObject);
var
   i: Integer;
begin
     // Figure out the number of shape series
     FNumShapes := 0;
     for i := 0 to Chart1.SeriesCount - 1 do
         if Chart1.Series[i] is TChartShape then
            Inc(FNumShapes);
     // Set Chart based on world
     Chart1.LeftAxis.Minimum := World.Origin.Z;
     Chart1.LeftAxis.Maximum := World.Origin.Z + World.Dimension.Z;
     Chart1.BottomAxis.Minimum := World.Origin.X;
     Chart1.BottomAxis.Maximum := World.Origin.X + World.Dimension.X;
     // set the maximum time a step may take
     FMaxTimeOfStep := 1000/tbMaxStepsPerSec.Position;
     // Use the ProtoFlock to set controls
     for i := 0 to clbBehaviors.Items.Count - 1 do
         clbBehaviors.Checked[i] := TFlockingBehavior(i) in ProtoFlock.Behaviors;
     tbAlignmentStrength.Position := round( ProtoFlock.StrengthAlignment * 100 );
     tbAvoidanceStrength.Position := round( ProtoFlock.StrengthAvoidance * 100 );
     tbSeparationStrength.Position := round( ProtoFlock.StrengthSeparation * 100 );
     tbCohesionStrength.Position := round( ProtoFlock.StrengthCohesion * 100 );
     tbNumFlocksChange( tbNumFlocks );
end;

procedure TfrmMain.btnOneStepClick(Sender: TObject);
begin
     // Update the flock one step
     UpdateFlock;
end;

procedure TfrmMain.btnStartClick(Sender: TObject);
var
   Time: Double;
   WaitTime: Double;
begin
     // Set flag that controls whether the simulation terminates
     FSimulate := True;
     // enable the stop button to allow user to stop simulation
     btnStart.Enabled := False;
     btnStop.Enabled := True;
     // Every time step, update the flock and allow the UI to process
     // messages so that user can stop the simulation
     while Simulate do
     begin
          Time := TimeGetTime;
          UpdateFlock;
          Application.ProcessMessages;
          WaitTime := TimeGetTime - Time;
          WaitTime := MaxTimeOfStep - WaitTime;
          if WaitTime > 0 then
             sleep(trunc(WaitTime));
          Application.ProcessMessages;
     end;
end;

procedure TfrmMain.btnStopClick(Sender: TObject);
begin
     // Stop simulation and enable Start button again
     FSimulate := False;
     btnStart.Enabled := True;
     btnStop.Enabled := False;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     // Stop simulating if we need to
     FSimulate := False;
     CanClose := True;
end;

procedure TfrmMain.UpdateFlock;
var
   i,j: Integer;
   Flock: TCustomFlock;
begin
  for i := 0 to World.FlockCount - 1 do
  begin
     Flock := World.Flock[i];
     // Update the flock... apply the flocking rules
     Flock.Execute;
     // Zero out any Y components that may have been introduced since
     // this is a 2D simulation
     with Flock do
          for j := 0 to Boids.Count - 1 do
          begin
               Boids[j].Position.Y := 0;
               Boids[j].Orientation.Y := 0;
          end;
  end;
end;

procedure TfrmMain.clbBehaviorsClickCheck(Sender: TObject);
var
   Behaviors: TFlockingBehaviors;
   i: Integer;
begin
     // Change the behaviors of the flocks
     Behaviors := [];
     if clbBehaviors.Checked[0] then
        Behaviors := Behaviors + [fbSeparation];
     if clbBehaviors.Checked[1] then
        Behaviors := Behaviors + [fbAlignment];
     if clbBehaviors.Checked[2] then
        Behaviors := Behaviors + [fbCohesion];
     if clbBehaviors.Checked[3] then
        Behaviors := Behaviors + [fbAvoidance];
     ProtoFlock.Behaviors := Behaviors;
     for i := 0 to World.FlockCount - 1 do
         World.Flock[i].Behaviors := Behaviors;
end;

procedure TfrmMain.tbMaxStepsPerSecChange(Sender: TObject);
begin
     // set the maximum time a step can take based on the number of
     // steps the user wants every second
     FMaxTimeOfStep := 1000/(Sender as TTrackBar).Position;
end;

procedure TfrmMain.CreateFlock;
begin
     // Create the flock and populate it
     with TFlock.Create( Self ) do
     begin
          Assign( ProtoFlock );
          World := Self.World;
          // Hook up the flock's OnChange event so that the flock automatically
          // informs the TeeChart of any changes
          OnChange := ProtoFlock.OnChange;
          OnApplyAvoidance := ProtoFlock.OnApplyAvoidance;
          // Store in the flock's tag a pointer to its Arrow series
          Tag := Integer(TArrowSeries.Create(Self));
          TArrowSeries(Tag).ParentChart := Chart1;
     end;
     // create the boids
     tbBoidsPerFlockChange( tbBoidsPerFlock );
end;

procedure TfrmMain.tbBoidsPerFlockChange(Sender: TObject);
var
   i,j: Integer;
   Flock: TCustomFlock;
begin
  for i := 0 to World.FlockCount - 1 do
  begin
     Flock := World.Flock[i];
     // This procedure changes the number of boids in each flock
     Flock.Boids.BeginUpdate;
     try
        with Sender as TTrackBar do
          if Position < Flock.Boids.Count then
             for j := 0 to (Flock.Boids.Count-1-Position) do
                 Flock.Boids.Delete(0)
          else if Position > Flock.Boids.Count then
             for j := 0 to (Position-(Flock.Boids.Count+1)) do
                 with Flock.Boids.Add do
                 begin
                      Position.SetXYZ( random(100), 0, random(100) );
                      Orientation.SetXYZ( random(2)-1, 0, random(2)-1 );
                      Orientation.Normalize;
                 end;
     finally
        Flock.Boids.EndUpdate;
     end;
  end;
end;

procedure TfrmMain.tbNumFlocksChange(Sender: TObject);
var
   j: Integer;
begin
  with Sender as TTrackBar do
    if Position < World.FlockCount then
       for j := 0 to (World.FlockCount-1-Position) do
       begin
            // Clear the series and then free the flock
            TArrowSeries(World.Flock[World.FlockCount-1].Tag).Clear;
            World.Flock[World.FlockCount-1].Free;
       end
    else if Position > World.FlockCount then
       for j := 0 to (Position-(World.FlockCount+1)) do
           CreateFlock;
end;

procedure TfrmMain.tbSeparationStrengthChange(Sender: TObject);
var
   i: Integer;
begin
     with Sender as TTrackBar do
          if Sender = tbSeparationStrength then
          begin
             ProtoFlock.StrengthSeparation := Position/100;
             for i := 0 to World.FlockCount - 1 do
                 World.Flock[i].StrengthSeparation := Position/100;
          end
          else if Sender = tbAlignmentStrength then
          begin
             ProtoFlock.StrengthAlignment := Position/100;
             for i := 0 to World.FlockCount - 1 do
                 World.Flock[i].StrengthAlignment := Position/100
          end
          else if Sender = tbCohesionStrength then
          begin
             ProtoFlock.StrengthCohesion := Position/100;
             for i := 0 to World.FlockCount - 1 do
                 World.Flock[i].StrengthCohesion := Position/100
          end
          else if Sender = tbAvoidanceStrength then
          begin
             ProtoFlock.StrengthAvoidance := Position/100;
             for i := 0 to World.FlockCount - 1 do
                 World.Flock[i].StrengthAvoidance := Position/100
          end
end;

procedure TfrmMain.Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
   NewX, NewY: Double;
begin
     if not (acpPosition in World.Flock[0].AutoCalcProperties) then
     begin
          (Sender as TChart).Series[NumShapes].GetCursorValues( NewX, NewY );
          World.Flock[0].Position.SetXYZ( NewX, 0, NewY );
     end;
end;

procedure TfrmMain.cbFollowMouseClick(Sender: TObject);
begin
     if (Sender as TCheckBox).Checked then
        World.Flock[0].AutoCalcProperties := [acpVelocity]
     else
        World.Flock[0].AutoCalcProperties := [acpPosition, acpVelocity];
end;

procedure TfrmMain.ProtoFlockChange(Sender: TObject);
var
   i: Integer;
   AFlockSeries: TArrowSeries;
begin
     // Every time the flock changes, redraw everything
     with Sender as TFlock do
     begin
          if Sender = ProtoFlock then Exit;
          AFlockSeries := TArrowSeries( Tag );
          AFlockSeries.Clear;
          for i := 0 to Boids.Count - 1 do
              AFlockSeries.AddArrow( Boids[i].Position.X,
                               Boids[i].Position.Z,
                               Boids[i].Position.X+Boids[i].Velocity.X*2,
                               Boids[i].Position.Z+Boids[i].Velocity.Z*2,
              '', clTeeColor );
     end;
end;

procedure TfrmMain.ProtoFlockApplyAvoidance(Sender: TObject;
  const Boid: TBoid; const Accumulator, Change: TVector);
var
   i: Integer;               
   v: TVector;
   Radius: Double;
begin
     // make sure we avoid the shapes too!
     // In a real application, you would probably move the avoidance into
     // a TFlockWorld or TBoid descendant
     // Note: this routine uses a collision sphere to detect collisions
     // we also make an assumption that two obstacles are not close enough to
     // set off collision avoidance at the same time so we can quit when we
     // detect the first imminent collision

     v := TVector.Create;
     try
        // we signal a collision by setting the tag of the boid to the shape index
        // we collided with
        Boid.Tag := -1;
        // find nearest shape
        for i := 0 to NumShapes - 1 do
        begin
             // calculate center point
             v.x := ((Chart1.Series[i] as TChartShape).X1 - TChartShape(Chart1.Series[i]).X0) / 2 +
                    TChartShape(Chart1.Series[i]).X0;
             v.z := (TChartShape(Chart1.Series[i]).Y1 - TChartShape(Chart1.Series[i]).Y0) / 2 +
                     TChartShape(Chart1.Series[i]).Y0;
             Radius := MaxValue([
                         Sqrt(Sqr(TChartShape(Chart1.Series[i]).X0-v.x)+Sqr(TChartShape(Chart1.Series[i]).Y0-v.z)),
                         Sqrt(Sqr(TChartShape(Chart1.Series[i]).X1-v.x)+Sqr(TChartShape(Chart1.Series[i]).Y0-v.z)),
                         Sqrt(Sqr(TChartShape(Chart1.Series[i]).X0-v.x)+Sqr(TChartShape(Chart1.Series[i]).Y1-v.z)),
                         Sqrt(Sqr(TChartShape(Chart1.Series[i]).X1-v.x)+Sqr(TChartShape(Chart1.Series[i]).Y1-v.z))
                       ]);
             if V.DistanceTo(Boid.Position) < (Radius + 2*Boid.Flock.SeparationDistance) then
             begin
                  // Move AWAY NOW!
                  // we are going to override all accumulations
                  // we reset the change to move directly away... to be more
                  // realistic, they should probably move along the wall of the
                  // shape
                  Change.Assign( Boid.Position );
                  Change.Subtract( v );
                  Change.SetMagnitudeOfVector( MaxValue([Boid.Flock.MaxUrgency,1]) );
                  Boid.Tag := 1;
                  Exit;
             end;
        end;
     finally
        v.Free;
     end;
end;

end.
