# Setup — Plugins

`claude-system` referencia dois plugins em `CLAUDE.md` e nas skills. Este guia cobre como instalá-los.

Ambos são opcionais mas recomendados — Claude usa Grep/Read como fallback quando não estão disponíveis.

---

## Serena — LSP code intelligence

**O que faz**: Navegação de código via LSP — encontra definições de símbolos, lista todos os usos de uma função, descobre o que implementa uma interface, busca por padrão no codebase.

**Source**: [github.com/oraios/serena](https://github.com/oraios/serena)

### Install

Disponível diretamente no marketplace do Claude Code. Abra o Claude Code e instale pelo marketplace (ícone de puzzle ou `/plugin install serena`).

Reinicie o Claude Code após instalar. Serena ativa automaticamente para projetos com linguagens suportadas (Python, TypeScript, Go, Java, Rust, entre outras).

### Quando o Claude usa

| Task | Tool chamado |
|------|-------------|
| Encontrar onde uma função/classe está definida | `find_symbol` |
| Listar todos os callers de uma função | `find_referencing_symbols` |
| Visão geral dos símbolos de um arquivo | `get_symbols_overview` |
| Descobrir o que implementa uma interface | `find_implementations` |
| Buscar por padrão de nome no codebase | `search_for_pattern` |

---

## Lumen — Semantic codebase search

**O que faz**: Indexa o codebase e permite busca por *conceito* em vez de token exato. Útil antes de análises amplas (security review, arch audit, tech debt) onde você quer contexto de múltiplos arquivos sem saber os nomes exatos dos símbolos.

**Source**: [github.com/ory/lumen](https://github.com/ory/lumen)

### Pré-requisito — Ollama com o modelo de embeddings

Lumen precisa do Ollama rodando localmente com o modelo de embeddings:

```bash
ollama pull ordis/jina-embeddings-v2-base-code
```

Inicie o Ollama antes de usar o Lumen.

### Install

**Passo 1** — Adicionar o marketplace da Ory no Claude Code:

```
/plugin marketplace add ory/claude-plugins
```

**Passo 2** — Instalar o Lumen:

```
/plugin install lumen@ory
```

**Passo 3** — Verificar a instalação em uma nova sessão:

```
/lumen:doctor
```

Na primeira sessão após instalar, o Lumen indexa o projeto automaticamente em background.

### Quando o Claude usa

| Task | Tool chamado |
|------|-------------|
| Busca por conceito antes de `/sec-review`, `/arch-debt`, `/dev-review` | `mcp__lumen__semantic_search` |
| Exploração inicial de codebase desconhecido antes de análise | `mcp__lumen__semantic_search` |

### Manutenção

Re-indexar após mudanças significativas no codebase:

```
/lumen:reindex
```

---

## Verificando que os dois estão ativos

Verifique o `~/.claude/settings.json`:

```json
{
  "enabledPlugins": {
    "serena@claude-plugins-official": true,
    "lumen@ory": true
  }
}
```
