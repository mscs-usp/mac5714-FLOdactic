TagsManager class

Respnsability: Manage all the tags within the system.

We used a Dictionary as a support structure to store the Tag objects. We choose to use a Dictionary instead of a Set since we pretend to dynamically update the count on DidacticMaterial associated with each tag, so we can have an idea on popular Tags.