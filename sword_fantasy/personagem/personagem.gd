extends CharacterBody2D

var _sufixo_da_animacao: String = "_baixo"

@export var _velocidade_de_movimento: float = 128.0
@export var _animador_do_personagem: AnimationPlayer

func _physics_process(delta: float) -> void:
	var direcao = Input.get_vector(
		"mover_esquerda", "mover_direita", "mover_cima", "mover_baixo"
	)
	
	velocity = direcao * _velocidade_de_movimento
	move_and_slide()
	
	_sufixo_da_animacao = _sufixo_do_personagem()
	_animar()

func _sufixo_do_personagem() -> String:
	var _acao_horizontal: float = Input.get_axis("mover_esquerda", "mover_direita")
	
	if _acao_horizontal == -1:
		return "_esquerda"
		
	if _acao_horizontal == +1:
		return "_direita"
	
	var _acao_vertical: float = Input.get_axis("mover_cima", "mover_baixo")
	if _acao_vertical == -1:
		return "_cima"
	
	if _acao_vertical == +1:
		return "_baixo"
	
	return _sufixo_da_animacao

func _animar() -> void:
	if velocity:
		_animador_do_personagem.play("andando" + _sufixo_da_animacao)
		return
	
	_animador_do_personagem.play("parado" + _sufixo_da_animacao)
