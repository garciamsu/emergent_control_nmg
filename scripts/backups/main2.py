#https://github.com/EnergyTransition/ESDL-PyEcore-Tutorial/blob/master/ESDLTutorials.ipynb
#https://github.com/redekok/startanalyse-esdl/blob/master/parse_data.py

from pyecore.resources import ResourceSet, URI
from pyecore.utils import DynamicEPackage
from pyecore.resources.resource import HttpURI
from xmlresource import XMLResource
from influxdbreader import attr_to_dict


def main():
    # create a resourceSet that hold the contents of the esdl.ecore model and the instances we use/create
    rset = ResourceSet()
    # Assign files with the .esdl extension to the XMLResource instead of default XMI
    rset.resource_factory['esdl'] = lambda uri: XMLResource(uri)  

    # Read the lastest esdl.ecore from github
    resource = rset.get_resource(HttpURI('https://raw.githubusercontent.com/EnergyTransition/ESDL/master/esdl/model/esdl.ecore'))
    esdl_model = resource.contents[0]
    print('Namespace: {}'.format(esdl_model.nsURI))
    rset.metamodel_registry[esdl_model.nsURI] = esdl_model
    # Create a dynamic model from the loaded esdl.ecore model, which we can use to build Energy Systems
    esdl = DynamicEPackage(esdl_model)
    resource = rset.get_resource(URI('PV.esdl'))
    es = resource.contents[0]
    # At this point, the model instance is loaded!

    # Now the model can be manipulated, e.g. add a PowerToX asset to the area.
    print(es.name)
    print(es.instance[0].area.asset)
    es.instance[0].area.asset.append(esdl.PowerToX(name='Power to Heat', id='powerToH'))
    print(es.instance[0].area.asset)
    # print a list of all the classes of the instance
    for child in es.eAllContents():
        print(attr_to_dict(child))
    # Save the result in the same file
    resource.save()

if __name__ == '__main__': 
    main()