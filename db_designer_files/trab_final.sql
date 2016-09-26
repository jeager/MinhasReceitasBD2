CREATE TABLE categoria (
  idcategoria INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR NULL,
  PRIMARY KEY(idcategoria)
);

CREATE TABLE uf (
  iduf INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR NULL,
  PRIMARY KEY(iduf)
);

CREATE TABLE receita (
  idreceita INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  categoria_idcategoria INTEGER UNSIGNED NOT NULL,
  titulo INTEGER UNSIGNED NULL,
  data_criacao DATE NULL,
  numero_porcoes INTEGER UNSIGNED NULL,
  PRIMARY KEY(idreceita, categoria_idcategoria),
  INDEX receita_FKIndex1(categoria_idcategoria)
);

CREATE TABLE cidade (
  idcidade INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  uf_iduf INTEGER UNSIGNED NOT NULL,
  nome VARCHAR NULL,
  PRIMARY KEY(idcidade, uf_iduf),
  INDEX cidade_FKIndex1(uf_iduf)
);

CREATE TABLE bairro (
  idbairro INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  cidade_uf_iduf INTEGER UNSIGNED NOT NULL,
  cidade_idcidade INTEGER UNSIGNED NOT NULL,
  nome VARCHAR NULL,
  PRIMARY KEY(idbairro, cidade_uf_iduf, cidade_idcidade),
  INDEX bairro_FKIndex1(cidade_idcidade, cidade_uf_iduf)
);

CREATE TABLE endereco (
  idendereco INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  bairro_cidade_idcidade INTEGER UNSIGNED NOT NULL,
  bairro_cidade_uf_iduf INTEGER UNSIGNED NOT NULL,
  bairro_idbairro INTEGER UNSIGNED NOT NULL,
  rua VARCHAR NULL,
  numero INTEGER UNSIGNED NULL,
  complemento VARCHAR NULL,
  cep INTEGER UNSIGNED NULL,
  PRIMARY KEY(idendereco, bairro_cidade_idcidade, bairro_cidade_uf_iduf, bairro_idbairro),
  INDEX endereco_FKIndex1(bairro_idbairro, bairro_cidade_uf_iduf, bairro_cidade_idcidade)
);

CREATE TABLE ingredientes (
  idingredientes INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  receita_idreceita INTEGER UNSIGNED NOT NULL,
  receita_categoria_idcategoria INTEGER UNSIGNED NOT NULL,
  quantidade INTEGER UNSIGNED NULL,
  medida VARCHAR NULL,
  data_fabricacao DATE NULL,
  validade DATE NULL,
  descricao VARCHAR NULL,
  PRIMARY KEY(idingredientes, receita_idreceita, receita_categoria_idcategoria),
  INDEX ingredientes_FKIndex1(receita_idreceita, receita_categoria_idcategoria)
);

CREATE TABLE passos (
  idpassos INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  receita_categoria_idcategoria INTEGER UNSIGNED NOT NULL,
  receita_idreceita INTEGER UNSIGNED NOT NULL,
  descricao VARCHAR NULL,
  tempo TIME NULL,
  PRIMARY KEY(idpassos, receita_categoria_idcategoria, receita_idreceita),
  INDEX passos_FKIndex1(receita_idreceita, receita_categoria_idcategoria)
);

CREATE TABLE tipo_endereco (
  idtipo_endereco INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  endereco_bairro_idbairro INTEGER UNSIGNED NOT NULL,
  endereco_bairro_cidade_uf_iduf INTEGER UNSIGNED NOT NULL,
  endereco_bairro_cidade_idcidade INTEGER UNSIGNED NOT NULL,
  endereco_idendereco INTEGER UNSIGNED NOT NULL,
  tipo VARCHAR NULL,
  PRIMARY KEY(idtipo_endereco, endereco_bairro_idbairro, endereco_bairro_cidade_uf_iduf, endereco_bairro_cidade_idcidade, endereco_idendereco),
  INDEX tipo_endereco_FKIndex1(endereco_idendereco, endereco_bairro_cidade_idcidade, endereco_bairro_cidade_uf_iduf, endereco_bairro_idbairro)
);

CREATE TABLE restaurante (
  idrestaurante INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  tipo_endereco_endereco_idendereco INTEGER UNSIGNED NOT NULL,
  tipo_endereco_endereco_bairro_cidade_idcidade INTEGER UNSIGNED NOT NULL,
  tipo_endereco_endereco_bairro_cidade_uf_iduf INTEGER UNSIGNED NOT NULL,
  tipo_endereco_endereco_bairro_idbairro INTEGER UNSIGNED NOT NULL,
  tipo_endereco_idtipo_endereco INTEGER UNSIGNED NOT NULL,
  nome VARCHAR NULL,
  PRIMARY KEY(idrestaurante, tipo_endereco_endereco_idendereco, tipo_endereco_endereco_bairro_cidade_idcidade, tipo_endereco_endereco_bairro_cidade_uf_iduf, tipo_endereco_endereco_bairro_idbairro, tipo_endereco_idtipo_endereco),
  INDEX restaurante_FKIndex1(tipo_endereco_idtipo_endereco, tipo_endereco_endereco_bairro_idbairro, tipo_endereco_endereco_bairro_cidade_uf_iduf, tipo_endereco_endereco_bairro_cidade_idcidade, tipo_endereco_endereco_idendereco)
);

CREATE TABLE editora (
  ideditora INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  tipo_endereco_endereco_idendereco INTEGER UNSIGNED NOT NULL,
  tipo_endereco_endereco_bairro_cidade_idcidade INTEGER UNSIGNED NOT NULL,
  tipo_endereco_endereco_bairro_cidade_uf_iduf INTEGER UNSIGNED NOT NULL,
  tipo_endereco_endereco_bairro_idbairro INTEGER UNSIGNED NOT NULL,
  tipo_endereco_idtipo_endereco INTEGER UNSIGNED NOT NULL,
  nome VARCHAR NULL,
  cnpj INTEGER UNSIGNED NULL,
  PRIMARY KEY(ideditora, tipo_endereco_endereco_idendereco, tipo_endereco_endereco_bairro_cidade_idcidade, tipo_endereco_endereco_bairro_cidade_uf_iduf, tipo_endereco_endereco_bairro_idbairro, tipo_endereco_idtipo_endereco),
  INDEX editora_FKIndex1(tipo_endereco_idtipo_endereco, tipo_endereco_endereco_bairro_idbairro, tipo_endereco_endereco_bairro_cidade_uf_iduf, tipo_endereco_endereco_bairro_cidade_idcidade, tipo_endereco_endereco_idendereco)
);

CREATE TABLE livro (
  idlivro INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  editora_tipo_endereco_idtipo_endereco INTEGER UNSIGNED NOT NULL,
  editora_tipo_endereco_endereco_bairro_idbairro INTEGER UNSIGNED NOT NULL,
  editora_tipo_endereco_endereco_bairro_cidade_uf_iduf INTEGER UNSIGNED NOT NULL,
  editora_tipo_endereco_endereco_bairro_cidade_idcidade INTEGER UNSIGNED NOT NULL,
  editora_tipo_endereco_endereco_idendereco INTEGER UNSIGNED NOT NULL,
  editora_ideditora INTEGER UNSIGNED NOT NULL,
  isbn INTEGER UNSIGNED NULL,
  PRIMARY KEY(idlivro, editora_tipo_endereco_idtipo_endereco, editora_tipo_endereco_endereco_bairro_idbairro, editora_tipo_endereco_endereco_bairro_cidade_uf_iduf, editora_tipo_endereco_endereco_bairro_cidade_idcidade, editora_tipo_endereco_endereco_idendereco, editora_ideditora),
  INDEX livro_FKIndex1(editora_ideditora, editora_tipo_endereco_endereco_idendereco, editora_tipo_endereco_endereco_bairro_cidade_idcidade, editora_tipo_endereco_endereco_bairro_cidade_uf_iduf, editora_tipo_endereco_endereco_bairro_idbairro, editora_tipo_endereco_idtipo_endereco)
);

CREATE TABLE funcionario (
  idfuncionario INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  tipo_endereco_endereco_idendereco INTEGER UNSIGNED NOT NULL,
  tipo_endereco_endereco_bairro_cidade_idcidade INTEGER UNSIGNED NOT NULL,
  tipo_endereco_endereco_bairro_cidade_uf_iduf INTEGER UNSIGNED NOT NULL,
  tipo_endereco_endereco_bairro_idbairro INTEGER UNSIGNED NOT NULL,
  tipo_endereco_idtipo_endereco INTEGER UNSIGNED NOT NULL,
  nome VARCHAR NULL,
  rg INTEGER UNSIGNED NULL,
  data_registro DATE NULL,
  matricula INTEGER UNSIGNED NULL,
  sexo VARCHAR NULL,
  salario FLOAT NULL,
  cpf INTEGER UNSIGNED NULL,
  naturalidade VARCHAR NULL,
  escolaridade VARCHAR NULL,
  uf_civil VARCHAR NULL,
  nome_mae VARCHAR NULL,
  nome_pai VARCHAR NULL,
  PRIMARY KEY(idfuncionario, tipo_endereco_endereco_idendereco, tipo_endereco_endereco_bairro_cidade_idcidade, tipo_endereco_endereco_bairro_cidade_uf_iduf, tipo_endereco_endereco_bairro_idbairro, tipo_endereco_idtipo_endereco),
  INDEX funcionario_FKIndex1(tipo_endereco_idtipo_endereco, tipo_endereco_endereco_bairro_idbairro, tipo_endereco_endereco_bairro_cidade_uf_iduf, tipo_endereco_endereco_bairro_cidade_idcidade, tipo_endereco_endereco_idendereco)
);

CREATE TABLE chef (
  idchef INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  funcionario_idfuncionario INTEGER UNSIGNED NOT NULL,
  funcionario_tipo_endereco_idtipo_endereco INTEGER UNSIGNED NOT NULL,
  funcionario_tipo_endereco_endereco_bairro_idbairro INTEGER UNSIGNED NOT NULL,
  funcionario_tipo_endereco_endereco_bairro_cidade_uf_iduf INTEGER UNSIGNED NOT NULL,
  funcionario_tipo_endereco_endereco_bairro_cidade_idcidade INTEGER UNSIGNED NOT NULL,
  funcionario_tipo_endereco_endereco_idendereco INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idchef, funcionario_idfuncionario, funcionario_tipo_endereco_idtipo_endereco, funcionario_tipo_endereco_endereco_bairro_idbairro, funcionario_tipo_endereco_endereco_bairro_cidade_uf_iduf, funcionario_tipo_endereco_endereco_bairro_cidade_idcidade, funcionario_tipo_endereco_endereco_idendereco),
  INDEX chef_FKIndex1(funcionario_idfuncionario, funcionario_tipo_endereco_endereco_idendereco, funcionario_tipo_endereco_endereco_bairro_cidade_idcidade, funcionario_tipo_endereco_endereco_bairro_cidade_uf_iduf, funcionario_tipo_endereco_endereco_bairro_idbairro, funcionario_tipo_endereco_idtipo_endereco)
);

CREATE TABLE degustador (
  iddegustador INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  funcionario_idfuncionario INTEGER UNSIGNED NOT NULL,
  funcionario_tipo_endereco_idtipo_endereco INTEGER UNSIGNED NOT NULL,
  funcionario_tipo_endereco_endereco_bairro_idbairro INTEGER UNSIGNED NOT NULL,
  funcionario_tipo_endereco_endereco_bairro_cidade_uf_iduf INTEGER UNSIGNED NOT NULL,
  funcionario_tipo_endereco_endereco_bairro_cidade_idcidade INTEGER UNSIGNED NOT NULL,
  funcionario_tipo_endereco_endereco_idendereco INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(iddegustador, funcionario_idfuncionario, funcionario_tipo_endereco_idtipo_endereco, funcionario_tipo_endereco_endereco_bairro_idbairro, funcionario_tipo_endereco_endereco_bairro_cidade_uf_iduf, funcionario_tipo_endereco_endereco_bairro_cidade_idcidade, funcionario_tipo_endereco_endereco_idendereco),
  INDEX degustador_FKIndex1(funcionario_idfuncionario, funcionario_tipo_endereco_endereco_idendereco, funcionario_tipo_endereco_endereco_bairro_cidade_idcidade, funcionario_tipo_endereco_endereco_bairro_cidade_uf_iduf, funcionario_tipo_endereco_endereco_bairro_idbairro, funcionario_tipo_endereco_idtipo_endereco)
);

CREATE TABLE avaliacao (
  degustador_funcionario_idfuncionario INTEGER UNSIGNED NOT NULL,
  degustador_iddegustador INTEGER UNSIGNED NOT NULL,
  receita_categoria_idcategoria INTEGER UNSIGNED NOT NULL,
  receita_idreceita INTEGER UNSIGNED NOT NULL,
  degustador_funcionario_tipo_endereco_endereco_idendereco INTEGER UNSIGNED NOT NULL,
  degustador_funcionario_tipo_endereco_endereco_bairro_cidade_idcidade INTEGER UNSIGNED NOT NULL,
  degustador_funcionario_tipo_endereco_endereco_bairro_cidade_uf_iduf INTEGER UNSIGNED NOT NULL,
  degustador_funcionario_tipo_endereco_endereco_bairro_idbairro INTEGER UNSIGNED NOT NULL,
  degustador_funcionario_tipo_endereco_idtipo_endereco INTEGER UNSIGNED NOT NULL,
  nota INTEGER UNSIGNED NULL,
  data_avaliacao DATE NULL,
  comentarios VARCHAR NULL,
  PRIMARY KEY(degustador_funcionario_idfuncionario, degustador_iddegustador, receita_categoria_idcategoria, receita_idreceita, degustador_funcionario_tipo_endereco_endereco_idendereco, degustador_funcionario_tipo_endereco_endereco_bairro_cidade_idcidade, degustador_funcionario_tipo_endereco_endereco_bairro_cidade_uf_iduf, degustador_funcionario_tipo_endereco_endereco_bairro_idbairro, degustador_funcionario_tipo_endereco_idtipo_endereco),
  INDEX degustador_has_receita_FKIndex1(degustador_iddegustador, degustador_funcionario_idfuncionario, degustador_funcionario_tipo_endereco_idtipo_endereco, degustador_funcionario_tipo_endereco_endereco_bairro_idbairro, degustador_funcionario_tipo_endereco_endereco_bairro_cidade_uf_iduf, degustador_funcionario_tipo_endereco_endereco_bairro_cidade_idcidade, degustador_funcionario_tipo_endereco_endereco_idendereco),
  INDEX degustador_has_receita_FKIndex2(receita_idreceita, receita_categoria_idcategoria)
);

CREATE TABLE chef_has_restaurante (
  chef_funcionario_idfuncionario INTEGER UNSIGNED NOT NULL,
  chef_idchef INTEGER UNSIGNED NOT NULL,
  restaurante_idrestaurante INTEGER UNSIGNED NOT NULL,
  chef_funcionario_tipo_endereco_endereco_idendereco INTEGER UNSIGNED NOT NULL,
  chef_funcionario_tipo_endereco_endereco_bairro_cidade_idcidade INTEGER UNSIGNED NOT NULL,
  chef_funcionario_tipo_endereco_endereco_bairro_cidade_uf_iduf INTEGER UNSIGNED NOT NULL,
  chef_funcionario_tipo_endereco_endereco_bairro_idbairro INTEGER UNSIGNED NOT NULL,
  chef_funcionario_tipo_endereco_idtipo_endereco INTEGER UNSIGNED NOT NULL,
  restaurante_tipo_endereco_idtipo_endereco INTEGER UNSIGNED NOT NULL,
  restaurante_tipo_endereco_endereco_bairro_idbairro INTEGER UNSIGNED NOT NULL,
  restaurante_tipo_endereco_endereco_bairro_cidade_uf_iduf INTEGER UNSIGNED NOT NULL,
  restaurante_tipo_endereco_endereco_bairro_cidade_idcidade INTEGER UNSIGNED NOT NULL,
  restaurante_tipo_endereco_endereco_idendereco INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(chef_funcionario_idfuncionario, chef_idchef, restaurante_idrestaurante, chef_funcionario_tipo_endereco_endereco_idendereco, chef_funcionario_tipo_endereco_endereco_bairro_cidade_idcidade, chef_funcionario_tipo_endereco_endereco_bairro_cidade_uf_iduf, chef_funcionario_tipo_endereco_endereco_bairro_idbairro, chef_funcionario_tipo_endereco_idtipo_endereco, restaurante_tipo_endereco_idtipo_endereco, restaurante_tipo_endereco_endereco_bairro_idbairro, restaurante_tipo_endereco_endereco_bairro_cidade_uf_iduf, restaurante_tipo_endereco_endereco_bairro_cidade_idcidade, restaurante_tipo_endereco_endereco_idendereco),
  INDEX chef_has_restaurante_FKIndex1(chef_idchef, chef_funcionario_idfuncionario, chef_funcionario_tipo_endereco_idtipo_endereco, chef_funcionario_tipo_endereco_endereco_bairro_idbairro, chef_funcionario_tipo_endereco_endereco_bairro_cidade_uf_iduf, chef_funcionario_tipo_endereco_endereco_bairro_cidade_idcidade, chef_funcionario_tipo_endereco_endereco_idendereco),
  INDEX chef_has_restaurante_FKIndex2(restaurante_idrestaurante, restaurante_tipo_endereco_endereco_idendereco, restaurante_tipo_endereco_endereco_bairro_cidade_idcidade, restaurante_tipo_endereco_endereco_bairro_cidade_uf_iduf, restaurante_tipo_endereco_endereco_bairro_idbairro, restaurante_tipo_endereco_idtipo_endereco)
);

CREATE TABLE receita_has_chef (
  receita_idreceita INTEGER UNSIGNED NOT NULL,
  chef_idchef INTEGER UNSIGNED NOT NULL,
  receita_categoria_idcategoria INTEGER UNSIGNED NOT NULL,
  chef_funcionario_idfuncionario INTEGER UNSIGNED NOT NULL,
  chef_funcionario_tipo_endereco_endereco_idendereco INTEGER UNSIGNED NOT NULL,
  chef_funcionario_tipo_endereco_endereco_bairro_cidade_idcidade INTEGER UNSIGNED NOT NULL,
  chef_funcionario_tipo_endereco_endereco_bairro_cidade_uf_iduf INTEGER UNSIGNED NOT NULL,
  chef_funcionario_tipo_endereco_endereco_bairro_idbairro INTEGER UNSIGNED NOT NULL,
  chef_funcionario_tipo_endereco_idtipo_endereco INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(receita_idreceita, chef_idchef, receita_categoria_idcategoria, chef_funcionario_idfuncionario, chef_funcionario_tipo_endereco_endereco_idendereco, chef_funcionario_tipo_endereco_endereco_bairro_cidade_idcidade, chef_funcionario_tipo_endereco_endereco_bairro_cidade_uf_iduf, chef_funcionario_tipo_endereco_endereco_bairro_idbairro, chef_funcionario_tipo_endereco_idtipo_endereco),
  INDEX receita_has_chef_FKIndex1(receita_idreceita, receita_categoria_idcategoria),
  INDEX receita_has_chef_FKIndex2(chef_idchef, chef_funcionario_idfuncionario, chef_funcionario_tipo_endereco_idtipo_endereco, chef_funcionario_tipo_endereco_endereco_bairro_idbairro, chef_funcionario_tipo_endereco_endereco_bairro_cidade_uf_iduf, chef_funcionario_tipo_endereco_endereco_bairro_cidade_idcidade, chef_funcionario_tipo_endereco_endereco_idendereco)
);

CREATE TABLE receita_has_livro (
  receita_categoria_idcategoria INTEGER UNSIGNED NOT NULL,
  receita_idreceita INTEGER UNSIGNED NOT NULL,
  livro_editora_ideditora INTEGER UNSIGNED NOT NULL,
  livro_editora_tipo_endereco_endereco_idendereco INTEGER UNSIGNED NOT NULL,
  livro_editora_tipo_endereco_endereco_bairro_cidade_idcidade INTEGER UNSIGNED NOT NULL,
  livro_editora_tipo_endereco_endereco_bairro_cidade_uf_iduf INTEGER UNSIGNED NOT NULL,
  livro_editora_tipo_endereco_endereco_bairro_idbairro INTEGER UNSIGNED NOT NULL,
  livro_editora_tipo_endereco_idtipo_endereco INTEGER UNSIGNED NOT NULL,
  livro_idlivro INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(receita_categoria_idcategoria, receita_idreceita, livro_editora_ideditora, livro_editora_tipo_endereco_endereco_idendereco, livro_editora_tipo_endereco_endereco_bairro_cidade_idcidade, livro_editora_tipo_endereco_endereco_bairro_cidade_uf_iduf, livro_editora_tipo_endereco_endereco_bairro_idbairro, livro_editora_tipo_endereco_idtipo_endereco, livro_idlivro),
  INDEX receita_has_livro_FKIndex1(receita_idreceita, receita_categoria_idcategoria),
  INDEX receita_has_livro_FKIndex2(livro_idlivro, livro_editora_tipo_endereco_idtipo_endereco, livro_editora_tipo_endereco_endereco_bairro_idbairro, livro_editora_tipo_endereco_endereco_bairro_cidade_uf_iduf, livro_editora_tipo_endereco_endereco_bairro_cidade_idcidade, livro_editora_tipo_endereco_endereco_idendereco, livro_editora_ideditora)
);


