1. Simulation de Propagation du Feu
 
 Objectif
La simulation permet de modéliser comment un feu se propage dans une forêt, en fonction de la densité d’arbres, du vent, de la distance de propagation et du comportement interne de chaque arbre.

Chaque arbre suit une machine à états finis :

intact → état initial

burning → l’arbre commence à brûler

burned → l’arbre est détruit

Un arbre en feu peut enflammer ses voisins selon une distance définie.

✨ Fonctionnalités principales
Génération d’une forêt aléatoire.

Paramétrage du taux de densité, du rayon de propagation, et de la probabilité d’ignition.

Transition automatique des états par FSM.

Statistiques en temps réel :

nombre d’arbres intacts

nombre d’arbres brûlants

nombre d’arbres détruits

Visualisation
Arbres verts = intacts

Arbres rouges = en train de brûler

Arbres noirs = détruits

▶️ Lancement
Dans GAMA :

Ouvrir le modèle "PropagationFeu".

Régler les paramètres (densité, probabilité de propagation, taille de la forêt).

Cliquer sur Run.

Observer l’évolution de la forêt au fil du temps.
