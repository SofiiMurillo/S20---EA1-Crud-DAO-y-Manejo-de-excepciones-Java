package com.iudigital.controller;

import com.iudigital.domain.Funcionario;
import com.iudigital.exceptions.DatabaseException;
import com.iudigital.data.FuncionarioDao;

import java.util.List;

public class FuncionarioController {

    private final FuncionarioDao funcionarioDao;

    public FuncionarioController() {
        this.funcionarioDao = new FuncionarioDao();
    }

    //Empezamos creando el funcionario
    public void createFuncionario(Funcionario funcionario) throws DatabaseException {
        try {
            funcionarioDao.create(funcionario);
        } catch (Exception e) {
            throw new DatabaseException("Error al guardar el funcionario", e);
        }
    }

    // Despues vamos a obtener todos los fumcionarios y tambien mostrar un mensaje de error en caso de que no se puedan mostrar
    public List<Funcionario> getFuncionarios() throws DatabaseException {
        try {
            return funcionarioDao.getFuncionarios(); 
        } catch (Exception e) {
            throw new DatabaseException("Error al obtener los funcionarios", e);
        }
    }

    // Luego vamos a obtener el funcionario segun du id y tambien manejar y mostrar un mensaje error si no se puede cumplir.
    public Funcionario getFuncionario(int id) throws DatabaseException {
        try {
            return funcionarioDao.getFuncionario(id); // corregido: nombre del método exacto
        } catch (Exception e) {
            throw new DatabaseException("Error al obtener el funcionario con ID: " + id, e);
        }
    }

    // Aqui nos ayudaremos a actualiza los datos de los funcionarios
    public void updateFuncionario(Funcionario funcionario) throws DatabaseException {
        try {
            funcionarioDao.update(funcionario);
        } catch (Exception e) {
            throw new DatabaseException("Error al actualizar el funcionario", e);
        }
    }

    // Ahora vamos a hacer uno que nos ayude a eliminar el funcionario segun su ID
    public void deleteFuncionario(int id) throws DatabaseException {
        try {
            funcionarioDao.delete(id);
        } catch (Exception e) {
            throw new DatabaseException("Error al eliminar el funcionario con ID: " + id, e);
        }
    }
}
