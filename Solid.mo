within TILMedia;
model Solid "Solid model with p as independent variable"

  replaceable model SolidType = TILMedia.SolidTypes.BaseSolid constrainedby
    TILMedia.SolidTypes.BaseSolid "type record of the solid"
    annotation(choicesAllMatching=true);

  constant SI.Density d = solid.d "Density";
  input SI.Temperature T "Temperature" annotation(Dialog);
  SI.SpecificHeatCapacity cp "Heat capacity";
  SI.ThermalConductivity lambda "Thermal conductivity";
  constant SI.SpecificHeatCapacity cp_nominal=solid.cp_nominal
    "Specific heat capacity at standard reference point";
  constant SI.ThermalConductivity lambda_nominal=solid.lambda_nominal
    "Thermal conductivity at standard reference point";
protected
  SolidType solid(final T=T);
equation
   cp = solid.cp;
   lambda = solid.lambda;

  annotation (defaultComponentName="solid", Icon(graphics={Text(
          extent={{-120,-60},{120,-100}},
          lineColor={135,135,135},
          textString=
               "%name"), Bitmap(
          extent={{-100,-100},{100,100}},
          imageSource=
              "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",
          fileName="modelica://TILMedia/Images/Solid_T.png")}),
          DymolaStoredErrors,
          Documentation(info="<html>
                   <p>
                   The solid model calculates the thermopyhsical property data with given input: temperature (T) and the model SolidType.<br>
                   The interface and the way of using, is demonstrated in the Testers -> <a href=\"Modelica:TILMedia.Testers.TestSolid\">TestSolid</a>.
                   </p>
                   </html>"));
end Solid;
