namespace BimGen.Tempest.Startup

open Autodesk.Revit.UI
open Autodesk.Revit.DB

type Main() =
    interface IExternalApplication with
        override x.OnStartup(app) = 
            TaskDialog.Show("Info", "Hello world!") |> ignore
            Result.Succeeded
        override x.OnShutdown(app) = Result.Succeeded
