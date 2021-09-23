'''
Created on Sep 23, 2021

@author: Matthew
'''
import User_Classes as uc

coach_Ellis = uc.User('John Ellis')

matthew = uc.Player('Matthew', 'Fuss', 30)
player2 = uc.Player('Matt', 'F', 30)

if __name__ == '__main__':
    coach_Ellis.add_player(matthew)
    coach_Ellis.add_player(player2)
    print(coach_Ellis.players[0].first_name)
    print(coach_Ellis.players[1].first_name)
    pass