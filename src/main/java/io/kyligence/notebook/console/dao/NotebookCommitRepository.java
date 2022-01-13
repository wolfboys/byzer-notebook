package io.kyligence.notebook.console.dao;

import io.kyligence.notebook.console.bean.entity.NotebookCommit;
import io.kyligence.notebook.console.bean.entity.SharedFileInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface NotebookCommitRepository extends JpaRepository<NotebookCommit, Integer> {

    @Query(value = "select * from notebook_commit where notebook_id = ?1", nativeQuery = true)
    List<NotebookCommit> listCommit(Integer notebook_id);

    @Query(value = "select * from notebook_commit where notebook_id = ?1 and commit_id = ?2", nativeQuery = true)
    List<NotebookCommit> findByCommit(Integer notebook_id, String commitId);

}
