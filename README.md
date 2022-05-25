
# Lettre de Motivation Generator

Salut et merci beaucoup d'utiliser ce bot! tu peux changer le code comme tu veux, personnaliser à ton goût et chercher les informations que tu souhaites.




## Installation

Avant de faire quoique ce soit, il faudra installer ruby


    
## WSL

Si tu travailles sur WSL, suis ces étapes pour installer Ruby.

---
Installons *rbenv*, un logiciel d'installation et de gestion des environnements Ruby.

Tout d'abord, nous devons supprimer toute installation préalable de Ruby que vous pourriez avoir :

```bash
rvm implode && sudo rm -rf ~/.rvm
# If you got "zsh: command not found: rvm", carry on.
# It means `rvm` is not on your computer, that's what we want!
rm -rf ~/.rbenv
```

Then in the terminal, run:

```bash
sudo apt install -y build-essential tklib zlib1g-dev libssl-dev libffi-dev libxml2 libxml2-dev libxslt1-dev libreadline-dev
```
```bash
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
```
```bash
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
```
---
Maintenant, vous êtes prêt à installer la dernière version de *ruby* et à la définir comme version par défaut.

Exécutez cette commande, cela prendra un certain temps (5-10 minutes)

```bash
rbenv install 3.0.3
```

Une fois l'installation de ruby terminée, exécutez cette commande pour indiquer au système d'utiliser la version 3.0.3 par défaut.

```bash
rbenv global 3.0.3
```

Réinitialisez votre terminal et vérifiez votre version de Ruby :

```bash
ruby -v
```

Success!!!
## Mac

Si tu travailles sur Mac, suis ces étapes pour installer Ruby.

---
Installons *rbenv*, un logiciel d'installation et de gestion des environnements Ruby.

Tout d'abord, nous devons supprimer toute installation préalable de Ruby que vous pourriez avoir :

```bash
rvm implode && sudo rm -rf ~/.rvm
# If you got "zsh: command not found: rvm", carry on. It means `rvm` is not
# on your computer, that's what we want!
sudo rm -rf $HOME/.rbenv /usr/local/rbenv /opt/rbenv /usr/local/opt/rbenv
```

Dans le terminal, exécutez :

```bash
brew uninstall --force rbenv ruby-build
```

Exécutez ensuite :

```bash
brew install rbenv
```

---
Maintenant, vous êtes prêt à installer la dernière version de *ruby* et à la définir comme version par défaut.

Exécutez cette commande, cela prendra un certain temps (5-10 minutes)

```bash
rbenv install 3.0.3
```

Une fois l'installation de ruby terminée, exécutez cette commande pour indiquer au système d'utiliser la version 3.0.3 par défaut.

```bash
rbenv global 3.0.3
```

Réinitialisez votre terminal et vérifiez votre version de Ruby :

```bash
ruby -v
```

Success!!!
## Initialisation du bot

Maintenant que tu as ruby, installe les gems necéssaires en faisant:

```bash
bundle install
```

Change les valeurs des variables avec les [] au début et pour lancer le bot exécute:

```bash
ruby main.rb
```