-- Atualizar a tabela resultados_quiz
ALTER TABLE resultados_quiz
DROP FOREIGN KEY resultados_quiz_ibfk_1,
DROP COLUMN quiz_id,
ADD COLUMN nivel VARCHAR(20) NOT NULL AFTER usuario_id;

-- Atualizar a tabela progresso_usuario
ALTER TABLE progresso_usuario
DROP COLUMN tempo_jogado,
ADD COLUMN acertos INT DEFAULT 0 AFTER data_jogo,
ADD COLUMN erros INT DEFAULT 0 AFTER acertos;

-- Recriar os índices
DROP INDEX IF EXISTS idx_resultados_quiz ON resultados_quiz;
CREATE INDEX idx_resultados_quiz ON resultados_quiz(usuario_id, nivel);

-- Recriar as chaves estrangeiras
ALTER TABLE resultados_quiz
ADD CONSTRAINT resultados_quiz_ibfk_1
FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
ON DELETE CASCADE; 