using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace wsTransferencias.Neg.Utils
{
    public static class Converting
    {
        public static object MapDictToObj(Dictionary<string, object> dict, Type destObject)
        {

            object returnobj = Activator.CreateInstance(destObject)!;

            foreach (string key in dict.Keys)
            {
                object value = dict[key];

                var targetProperty = destObject.GetProperty(key);

                if (targetProperty!.PropertyType == typeof(string))
                {
                    targetProperty.SetValue(returnobj, value);
                }
                else
                {

                    var parseMethod = targetProperty.PropertyType.GetMethod("TryParse",
                        BindingFlags.Public | BindingFlags.Static, null,
                        new[] { typeof(string), targetProperty.PropertyType.MakeByRefType() }, null);

                    if (parseMethod != null)
                    {
                        var parameters = new[] { value, null };
                        var success = (bool)parseMethod.Invoke(null, parameters)!;
                        if (success)
                        {
                            targetProperty.SetValue(returnobj, parameters[1]);
                        }

                    }
                }

            }

            return returnobj;
        }

    }
}
