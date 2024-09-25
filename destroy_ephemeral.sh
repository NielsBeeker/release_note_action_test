#!/bin/bash

# Vérifiez si GitHub CLI est installé
if ! command -v gh &> /dev/null
then
    echo "GitHub CLI (gh) n'est pas installé. Veuillez l'installer et réessayer."
    exit 1
fi

# Liste des éléments à vérifier (peut être passée sous forme d'argument ou d'un fichier)
input_list=(330 362 506 509 521 543 551 555 556 559 560 562 563 564 565 566 567 568 570 572 589 595 600 602 611 618 627 628 630 632 633 634 642 651 654 662 680 687 690 700 726 729 737 742 751 757 762 763 766 767 773 785 787 801 806 807 808 809 815 816 818 821 822 827 828 831 832 833 834 836 837 839 840 841 842 844 850 852 862 863 866 869 875 878 880 884 885 888 889)  # Remplacez par vos éléments

# Si vous voulez lire depuis un fichier, vous pouvez utiliser :
# input_list=$(cat filename.txt)  # chaque élément sur une nouvelle ligne dans le fichier

# Obtenir la liste des PR fermées
echo "Récupération des PR fermées..."
closed_prs=$(gh pr list --state closed --json number,title,headRefName --jq '.[] | "\(.number):\(.title) \(.headRefName)"')

# Vérifiez si les PR fermées contiennent des éléments de la liste
for element in "${input_list[@]}"; do
    if echo "$closed_prs" | grep -q "$element"; then
        echo "L'élément \"$element\" se trouve dans les PR fermées."
    else
        echo "L'élément \"$element\" ne se trouve PAS dans les PR fermées."
    fi
done
