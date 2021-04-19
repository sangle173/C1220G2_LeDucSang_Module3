package model.repo;

import java.util.List;

public interface IDBRepo<E> {
    void add(E e);

    List<E> getAll();

    boolean delete(int id);

    boolean update(E e);
}
