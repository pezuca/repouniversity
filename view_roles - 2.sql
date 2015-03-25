CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `roles` AS
    select 
        `u`.`id_usuario` AS `id_usuario`,
        `u`.`user` AS `user`,
        `u`.`pass` AS `pass`,
        'docente' AS `rol`,
        `p`.`id_persona` AS `id_persona`
    from
        ((`usuario` `u`
        join `persona` `p` ON ((`p`.`id_persona` = `u`.`id_persona`)))
        join `docente` `a` ON ((`a`.`id_persona` = `p`.`id_persona`))) 
    union select 
        `u`.`id_usuario` AS `id_usuario`,
        `u`.`user` AS `user`,
        `u`.`pass` AS `pass`,
        'alumno' AS `rol`,
        `p`.`id_persona` AS `id_persona`
    from
        ((`usuario` `u`
        join `persona` `p` ON ((`p`.`id_persona` = `u`.`id_persona`)))
        join `alumno` `a` ON ((`a`.`id_persona` = `p`.`id_persona`))) 
    union select 
        `u`.`id_usuario` AS `id_usuario`,
        `u`.`user` AS `user`,
        `u`.`pass` AS `pass`,
        'administrador' AS `rol`,
        `u`.`id_persona` AS `id_persona`
    from
        `usuario` `u`
    where
        ((not (`u`.`id_persona` in (select 
                `alumno`.`id_persona`
            from
                `alumno`)))
            and (not (`u`.`id_persona` in (select 
                `docente`.`id_persona`
            from
                `docente`))))