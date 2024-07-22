const data = ["adventure_time_tree.jpg", "aenami_endless.jpg", "aesthetic_deer.png", "alone_u_stand.png", "anime_circuit.png", "apex_octane.jpg", "arkane_jinx_graf.jpg", "arkane_jinx_psych.jpg", "boat_abondoned.jpg", "boat_minimal.jpg", "brown_cardigan.jpg", "bubble_in_rain.jpg", "cat_cycle.png", "cat_leaves.png", "cat_lofi_cafe.jpg", "cat_metro_dews.jpg", "cat_nord_tree.png", "cat_roof.jpg", "cat_sleeping.jpg", "cat_stray.png", "cat_tcd.png", "chainsaw_angel_city.jpg", "chainsaw_angel_lake.jpg", "chainsaw_denji_cat.png", "chainsaw_denji_makimo.jpg", "chainsaw_denji_purple.png", "chainsaw_denji_red.jpg", "chainsaw_denji_retro.png", "chainsaw_hayakawa_summon.jpg", "chainsaw_makima_neon.jpg", "chainsaw_makima_nord.jpg", "chainsaw_makima_paint.jpg", "chainsaw_makima_pink.png", "chainsaw_makima_store.jpg", "chainsaw_reze_inked.jpg", "chainsaw_yoru_pink.jpg", "cherry_blossoms.jpg", "clan_connections.png", "cozy_bridge.jpg", "cozy_street.jpg", "dark_purple_kimono.png", "debian_tribal_pink.png", "dedsec_hacked.png", "dedsec_takeover.jpg", "delorean_pastel.png", "ds4_purple.png", "ds_giyu.png", "ds_tanjiro.jpg", "electrichearts_kiki.png", "escape_velocity.jpg", "firewatch_purple.png", "flying_out.png", "forest_dark_winter.jpg", "forest_moonset.png", "forest_read.jpg", "getsuga_tensho.jpg", "goblin_slayer.jpg", "grey_skull.jpg", "homura_arch.png", "hyperbeast_cs.jpg", "jormungandr.jpg", "krita_digiart.png", "melting_astro.jpg", "mountain_jaws.jpg", "mountain_mist.jpg", "mountain_murky.jpg", "mountain_unsplash.jpg", "mountain_yosemite.png", "nier_2b.jpg", "nier_mech.png", "nord_batman.png", "nord_dracula.png", "nord_drifter.jpg", "peaceful_gloomy.jpg", "peaceful_paddy.jpg", "pink_lava.jpg", "pink_pc.jpg", "pink_silhouette.png", "poly_glitch.png", "purp_city.png", "rain_world1.png", "rain_world2.png", "re_creators.jpg", "red_purple.jpg", "rose_pine_pool.png", "sable.jpg", "samurai_bebop.png", "samurai_doge.png", "samurai_hills.jpg", "samurai_strike.jpg", "samurai_uwide.png", "sao_kirito.jpg", "sao_sinon.png", "shaded_landscape.png", "shooting_stars.jpg", "space_piano.png", "steamdeck_xray.png", "strange_horizon.jpg", "street_dusk.png", "switch_swirl.jpg", "the_end.png", "underwater_whale.jpg", "valorant_fade.jpg", "vector_planet_hrzn.png", "vector_planet_moon.png", "vector_planet_rocks.png", "velvet_crowe.jpg", "vivid_poki.jpg", "willow_rays.jpg", "wing_girl.jpg", "yoshika_miyako.jpg", "background.jpg", ];
let usedIndices = [];

function getRandom() {
    let prefix = 'Backgrounds/';
    if (usedIndices.length === data.length) {
        usedIndices = [];
    }

    let index;
    do {
        index = Math.floor(Math.random() * data.length);
    } while (usedIndices.includes(index));

    usedIndices.push(index);
    return prefix + data[index];
}
