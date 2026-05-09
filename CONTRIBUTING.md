# Contributing to claude-system

## O que você pode contribuir

- **Nova skill** — novo domínio ou comando que não existe ainda
- **Melhoria de skill existente** — output mais útil, melhor template, trigger mais preciso
- **Novo agent** — especialização que justifica contexto isolado
- **Hook de segurança** — novo padrão a bloquear ou novo evento a monitorar
- **Correção** — bug em regex de hook, frontmatter inválido, instrução ambígua

Veja o [ROADMAP.md](ROADMAP.md) para o que está planejado e evitar trabalho duplicado.

---

## Adicionando uma nova skill

### 1. Estrutura do arquivo

```
skills/
└── nome-do-skill/
    └── SKILL.md
```

Nome em kebab-case, inglês. Exemplos: `cloud-cost`, `fe-a11y`, `em-1on1`.

### 2. Formato do SKILL.md

```markdown
---
name: nome-do-skill
description: Uma linha — o que o skill faz. Claude lê isso para decidir quando auto-invocar.
when_to_use: Quando invocar automaticamente — frases, gatilhos, contextos. Omitir se for manual.
allowed-tools: Read Grep Glob Bash(git log *)
---

[Instrução compacta para o Claude. Sem prosa, sem padding.]

Output:
[Template estruturado da saída esperada — tabelas, listas, seções fixas]
```

### 3. Regras de qualidade

**`description`**
- Uma frase que responde "o que esse skill produz?"
- Claude usa para decidir se auto-invoca — seja específico

**`when_to_use`**
- Descreve os gatilhos: situações, palavras-chave, contextos
- Omitir em skills que devem ser manuais (documentos formais, auditorias)

**`allowed-tools`**
- Mínimo necessário — não adicionar `WebSearch` se o skill só lê código local
- Formatos aceitos: `Read`, `Grep`, `Glob`, `Bash(git log *)`, `WebSearch`

**Output**
- Sempre estruturado: tabelas, listas, seções com headers
- Nunca parágrafos soltos
- Testável: quem receber o output consegue agir sem perguntar mais nada

### 4. Testar antes de abrir PR

```bash
# Instalar localmente
bash install.sh

# Invocar o skill em um projeto real
# /nome-do-skill [argumento]

# Verificar se o output é acionável
```

---

## Adicionando um novo agent

```
agents/
└── nome-agent/
    └── AGENT.md
```

```markdown
---
name: nome-agent
description: Quando delegar para este agent — Claude lê isso para decidir.
when_to_use: Contextos específicos de delegação.
tools:
  - Read
  - Grep
  - Glob
---

[System prompt do agent — identidade, regras, restrições]
```

**Quando justifica um agent vs uma skill**:
- Precisa de contexto completamente isolado da conversa principal
- Requer ferramentas restritas por segurança (ex: sec-agent sem Bash)
- Tarefa longa que poluiria o contexto principal

---

## Modificando hooks de segurança

Os hooks ficam em `hooks/`. Toda mudança deve:

1. Manter o padrão: lê JSON via stdin, extrai o campo relevante com python3, aplica regex
2. Escrever erros em stderr (`echo "BLOCKED: ..." >&2`) e sair com código 2
3. Não bloquear casos que não são destrutivos — falso positivo é custo real
4. Incluir comentário explicando o que o padrão captura

Teste manual antes de abrir PR:
```bash
# Testar padrão diretamente (sem acionar o hook)
echo "comando a testar" | grep -qE 'seu-padrao' && echo "bloquearia" || echo "passaria"
```

---

## Processo de PR

1. Fork + branch a partir de `main`
2. Nome da branch: `skill/nome-do-skill`, `fix/descricao`, `agent/nome`
3. PR deve incluir:
   - O que foi adicionado/mudado
   - Por que (qual gap fecha ou qual bug corrige)
   - Como testar
4. Não misture skills de domínios diferentes no mesmo PR
5. Se for skill nova, adicione uma linha na tabela de skills do `README.md`

---

## Dúvidas

Abra uma issue descrevendo o skill ou melhoria antes de implementar — evita trabalho em duplicata com o que está no ROADMAP.
