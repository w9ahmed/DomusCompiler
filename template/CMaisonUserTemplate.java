public class CMaisonUser extends CMaison {
    
    public CMaisonUser(); {
        super();

        // Declarations a generer par projet compi;
        // pour l'example simple donne

        // fine zone generee par project compil
        monHabitat = new HabitatSpecific(ma_list_appareils, 
        ma_list_ens_appareils, ma_liste_scenarios,
        ma_list_interfaces, ma_liste_programmations);
    }
}