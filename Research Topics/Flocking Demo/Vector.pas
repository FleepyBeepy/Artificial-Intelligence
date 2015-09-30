//=== File Prolog ============================================================
//	This code was developed by RiverSoftAVG.
//
//--- Notes ------------------------------------------------------------------
//                    
//--- Development History  ---------------------------------------------------
//
//	03/2001	   T. Grubb
//		   - Added Overloaded CrossProduct, DotProduct, and DistanceTo
//                   methods to TVector, which accept 3 reals
//	01/2001	   T. Grubb
//		   Initial version.
//
//      File Contents:
//           TVector       3D Vector Class
//
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
unit Vector;

interface

uses
    Classes;
    
type
  TVector = class(TPersistent)
  { Purpose: To encapsulate a vector }
  private
    { Private declarations }
    FX: Single;
    FY: Single;
    FZ: Single;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create; overload; virtual;
    constructor Create( const X, Y, Z: Single ); overload;
    constructor Create( const Vector: TVector ); overload;
    procedure Assign(Source: TPersistent); override;
    procedure Add( const Vector: TVector ); overload;
    procedure Add( const Value: Single ); overload;
    procedure Clear; virtual;
    procedure CrossProduct( const Vector: TVector ); overload;
    procedure CrossProduct( const X, Y, Z: Single ); overload;
    procedure Divide( const Vector: TVector ); overload;
    procedure Divide( const Value: Single ); overload;
    function DotProduct( const Vector: TVector ): Single; overload;
    function DotProduct( const X, Y, Z: Single ): Single; overload;
    function DistanceTo( const Vector: TVector ): Single; overload;
    function DistanceTo( const X, Y, Z: Single ): Single; overload;
    procedure Multiply( const Vector: TVector ); overload;
    procedure Multiply( const Value: Single ); overload;
    procedure Normalize;
    function Length: Single;
    procedure SetMagnitudeOfVector( const Velocity: Single );
    procedure SetXYZ( const X, Y, Z: Single );
    procedure Subtract( const Vector: TVector ); overload;
    procedure Subtract( const Value: Single ); overload;
  published
    { Published declarations }
    property X: Single read FX write FX;
    property Y: Single read FY write FY;
    property Z: Single read FZ write FZ;
  end; { TVector }

implementation

{ TVector }

procedure TVector.Add(const Vector: TVector);
begin
     FX := FX + Vector.X;
     FY := FY + Vector.Y;
     FZ := FZ + Vector.Z;
end;

procedure TVector.Add(const Value: Single);
begin
     FX := FX + Value;
     FY := FY + Value;
     FZ := FZ + Value;
end;

procedure TVector.Assign(Source: TPersistent);
begin
     if Source is TVector then
     begin
          FX := TVector(Source).X;
          FY := TVector(Source).Y;
          FZ := TVector(Source).Z;
          Exit;
     end;
     inherited;
end;

procedure TVector.Clear;
begin
     FX := 0;
     FY := 0;
     FZ := 0;
end;

constructor TVector.Create(const Vector: TVector);
begin
     Create;
     FX := Vector.X;
     FY := Vector.Y;
     FZ := Vector.Z;
end;

constructor TVector.Create(const X, Y, Z: Single);
begin
     Create;
     FX := X;
     FY := Y;
     FZ := Z;
end;

constructor TVector.Create;
begin

end;

procedure TVector.CrossProduct(const Vector: TVector);
var
   tempX, tempY, tempZ: Single;
begin
     tempX := X * Vector.Z - Z*Vector.Y;
     tempY := Z * Vector.X - X*Vector.Z;
     tempZ := X * Vector.Y - Y*Vector.X;
     SetXYZ( tempX, tempY, tempZ );
end;

procedure TVector.CrossProduct(const X, Y, Z: Single);
var
   tempX, tempY, tempZ: Single;
begin
     tempX := FX * Z - FZ*Y;
     tempY := FZ * X - FX*Z;
     tempZ := FX * Y - FY*X;
     SetXYZ( tempX, tempY, tempZ );
end;

function TVector.DistanceTo(const Vector: TVector): Single;
begin
     result := Sqrt( Sqr(X-Vector.X) +
                     Sqr(Y-Vector.Y) +
                     Sqr(Z-Vector.Z) );
end;

function TVector.DistanceTo(const X, Y, Z: Single): Single;
begin
     result := Sqrt( Sqr(FX-X) +
                     Sqr(FY-Y) +
                     Sqr(FZ-Z) );
end;

procedure TVector.Divide(const Vector: TVector);
begin
     FX := X / Vector.X;
     FY := Y / Vector.Y;
     FZ := Z / Vector.Z;
end;

procedure TVector.Divide(const Value: Single);
begin
     FX := X / Value;
     FY := Y / Value;
     FZ := Z / Value;
end;

function TVector.DotProduct(const Vector: TVector): Single;
begin
     result := (X*Vector.X) + (Y*Vector.Y) + (Z*Vector.Z);
end;

function TVector.DotProduct(const X, Y, Z: Single): Single;
begin
     result := (FX*X) + (FY*Y) + (FZ*Z);
end;

function TVector.Length: Single;
begin
     result := Sqrt( X*X + Y*Y + Z*Z );
end;

procedure TVector.Multiply(const Vector: TVector);
begin
     FX := X * Vector.X;
     FY := Y * Vector.Y;
     FZ := Z * Vector.Z;
end;

procedure TVector.Multiply(const Value: Single);
begin
     FX := X * Value;
     FY := Y * Value;
     FZ := Z * Value;
end;

procedure TVector.Normalize;
var
   m: Single;
begin
     M := Length;
     if m > 0 then
        m := 1 / m
     else
         m := 0;
     FX := X * m;
     FY := Y * m;
     FZ := Z * m;
end;

procedure TVector.SetMagnitudeOfVector(const Velocity: Single);
begin
     Normalize;
     FX := X * Velocity;
     FY := Y * Velocity;
     FZ := Z * Velocity;
end;

procedure TVector.SetXYZ(const X, Y, Z: Single);
begin
     FX := x;
     FY := y;
     FZ := z;
end;

procedure TVector.Subtract(const Vector: TVector);
begin
     FX := FX - Vector.X;
     FY := FY - Vector.Y;
     FZ := FZ - Vector.Z;
end;

procedure TVector.Subtract(const Value: Single);
begin
     FX := FX - Value;
     FY := FY - Value;
     FZ := FZ - Value;
end;

end.
