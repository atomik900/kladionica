import datetime
import mysql.connector as conn
import socket

available_matches = []
available_match_ids = []


class Match:

    def __init__(self,team1,team2,odds,kickoff_time,match_id=1):

        self.team1 = team1
        self.team2 = team2
        self.odds = odds
        self.kickoff_time = kickoff_time
        self.match_id = match_id

    def get_match_id(self):

        
        for match in available_matches:
            available_match_ids.append(match.match_id)
        self.match_id = (available_match_ids.pop()+1)

    def __str__(self):

        return f'{self.kickoff_time} | {self.team1.name}   VS  {self.team2.name}  |  1 :  {self.odds.home} | X : {self.odds.draw} | 2 : {self.odds.away}  | MATCH ID : {self.match_id} '


class TicketMatch:

    def __init__(self,ticketMatch,tip):

        self.ticketMatch = ticketMatch
        self.tip = tip


class Team:

    def __init__(self,name,league):

        self.name = name
        self.league = league


class Odds:

    def __init__(self,home,draw,away):

        self.home = home
        self.draw = draw
        self.away = away


class League :

    def __init__(self,name,teams):

        self.name = name
        self.teams = []


class Ticket:

        def __init__(self,ticketMatches,sum,total_tip=1):

            self.ticketMatches = []
            self.sum = sum
            self.total_tip = total_tip
            
        def potential_winning_sum(self):


            list_of_all_tips = []
            for ticketMatch in self.ticketMatches:
                list_of_all_tips.append(ticketMatch.tip)
            for tip in list_of_all_tips:
                self.total_tip = self.total_tip * tip
            return self.total_tip * self.sum

        def total_quota(self):
            list_of_all_tips = []
            for ticketMatch in self.ticketMatches:
                list_of_all_tips.append(ticketMatch.tip)
            for tip in list_of_all_tips:
                self.total_tip = self.total_tip * tip
            return self.total_tip


SerieA = League("Serie A - Italia",[])
juventus = Team('Juventus',SerieA)
milan = Team('AC Milan',SerieA)
parma = Team('Parma',SerieA)
roma = Team('Roma',SerieA)
inter = Team('Inter Milano',SerieA)
sampdoria = Team('Sampdoria',SerieA)
SerieA.teams.append(juventus)
SerieA.teams.append(milan)
SerieA.teams.append(parma)
SerieA.teams.append(roma)
SerieA.teams.append(inter)
SerieA.teams.append(sampdoria)
PrimeraDivision = League("Primera Division - Espana",[])
real = Team('Real Madrid',PrimeraDivision)
barsa = Team('Barcelona',PrimeraDivision)
valencia = Team('Valencia',PrimeraDivision)
sevilla = Team('Sevilla',PrimeraDivision)
atletico = Team('Atletico Madrid',PrimeraDivision)
bilbao = Team('Atletik de Bilbao',PrimeraDivision)
PrimeraDivision.teams.append(real)
PrimeraDivision.teams.append(barsa)
PrimeraDivision.teams.append(valencia)
PrimeraDivision.teams.append(atletico)
PrimeraDivision.teams.append(sevilla)
PrimeraDivision.teams.append(bilbao)
odds_for_milan_juventus = Odds(2.65,2.85,2.65)
odds_for_parma_roma = Odds(2.35,3.20,2.85)
odds_for_inter_sampdoria = Odds(1.30,3.30,5.45)
odds_for_real_barca = Odds(2.25,2.85,2.55)
odds_for_valencia_atletico = Odds(1.85,3.1,3.30)
odds_for_seviila_bilbao = Odds(1.45,3.1,3.55)
milan_juventus = Match(milan,juventus,odds_for_milan_juventus,datetime.datetime(2020,3,14,15,30))
available_matches.append(milan_juventus)
parma_roma = Match(parma,roma,odds_for_parma_roma,datetime.datetime(2020,3,14,15,30))
parma_roma.get_match_id()
available_matches.append(parma_roma)
inter_sampdoria = Match(inter,sampdoria,odds_for_inter_sampdoria,datetime.datetime(2020,3,14,20))
inter_sampdoria.get_match_id()
available_matches.append(inter_sampdoria)
real_barca = Match(real,barsa,odds_for_real_barca,datetime.datetime(2020,3,15,20,30))
real_barca.get_match_id()
available_matches.append(real_barca)
valencia_atletico = Match(valencia,atletico,odds_for_valencia_atletico,datetime.datetime(2020,3,15,16,30))
valencia_atletico.get_match_id()
available_matches.append(valencia_atletico)
sevilla_bilbao = Match(sevilla,bilbao,odds_for_seviila_bilbao,datetime.datetime(2020,3,15,17))
sevilla_bilbao.get_match_id()
available_matches.append(sevilla_bilbao)


class User:

    def __init__(self,username,credit,ticket=Ticket([],0)):

        self.username = username
        self.credit = credit
        self.ticket = ticket

    def show_matches(self):

        print('KICKOFF                        HOME                    AWAY                1          X           2       ID')
        for match in available_matches:
            print(f'{match.kickoff_time}            {match.team1.name}             {match.team2.name}          {match.odds.home}       {match.odds.draw}       {match.odds.away}       {match.match_id} ')
        self.start_gambling()    


    def add_match_to_ticket(self):
        # chosen_match = Match()
        match_choice = int(input('ENTER ID OF SELECTED MATCH\n'))
        if match_choice not in available_match_ids:
            print(f' {match_choice} is an invalid match ID \n')
            self.add_match_to_ticket()    
        else:
            for match in available_matches:
                if match_choice == match.match_id:
                    if datetime.datetime.now() > match.kickoff_time:
                        print("WHOOPS! THAT MATCH HAS ALREADY STARTED\n")
                    else:    
                        chosen_match = match
                        print(match)
                        tip_choice = input("What'll it be 1, 0 or 2 ?\n")
                        if tip_choice == '1':
                            tickmatch = TicketMatch(chosen_match,chosen_match.odds.home)
                            self.ticket.ticketMatches.append(tickmatch)
                            print(f'You have successfully betted on {chosen_match.team1.name} wtih a quota of {chosen_match.odds.home}\n')
                            available_matches.remove(match)
                        elif tip_choice == '0':
                            tickmatch = TicketMatch(chosen_match,chosen_match.odds.draw)
                            self.ticket.ticketMatches.append(tickmatch)
                            print(f'You have successfully betted on a draw between {chosen_match.team1.name} and {chosen_match.team2.name} with a quota of {chosen_match.odds.draw} \n')
                        elif tip_choice == '2':
                            tickmatch = TicketMatch(chosen_match,chosen_match.odds.away)
                            self.ticket.ticketMatches.append(tickmatch)
                            print(f'You have successfully betted on {chosen_match.team2.name} wtih a quota of {chosen_match.odds.away}\n')
                        else:
                            print('INVALID TIP CHOICE!')
        self.start_gambling()

    def proceed_to_payment(self):

        
        print('YOUR TICKET:')
        for match in self.ticket.ticketMatches:
            print(f'{match.ticketMatch.kickoff_time} | {match.ticketMatch.team1.name} VS {match.ticketMatch.team2.name} | QUOTA : {match.tip}')
        print(f'The total quota is : {self.ticket.total_quota()}')
        quota = self.ticket.total_quota()

        amount_to_bet = int(input('Enter the amount you wish to bet on your ticket\n'))
        if amount_to_bet > self.credit:
            print('INSUFFICIENT FUNDS!\n')
            self.proceed_to_payment()
        else:
            # self.total_tip = self.ticket.potential_winning_sum()
            self.ticket.sum = amount_to_bet
            self.credit-=amount_to_bet
            
            print(f'Your total winnings for ${self.ticket.sum} on the total quota of {quota} is {self.ticket.potential_winning_sum()} ')
            definitive = input("1)CONFIRM BET\n2)MAKE CHANGES\n")
            if definitive == '1':
                db = conn.connect(
                    host="www.gubitnik.com",
                    username="root",
                    database="kladionica",
                    passwd="pozz"
                )
                cur = db.cursor()
                cur.execute(f'Insert into kladionica.ticket values(4,{self.ticket.sum},{self.ticket.total_tip})')
                db.commit()
                db.close()
                print('YOUR TICKET HAS BEEN SUCCESSFULLY ENTERED INTO THE DATABASE\n')
            elif definitive == "2":
                self.start_gambling()
            else:
                print('INVALID INPUT')
                self.proceed_to_payment()

    def start_gambling(self):

        choice = input('1)VIEW AVAILABLE MATCHES\n2)ADD MATCH TO TICKET\n3)PROCEED TO PAYMENT\n4)EXIT PROGRAM\n')
        if choice == '1':
            self.show_matches()
        elif choice == '2':
            self.add_match_to_ticket()
        elif choice == '3':
            self.proceed_to_payment()
        elif choice == '4':
            print("You'll be back! They all come back!")
        else:
            print("INVALID INPUT")
            self.start_gambling()



user1 = User("jim",200)
user1.start_gambling()







# server = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
# server.bind(('localhost',8888))
# server.listen()
# klijent,adresa = server.accept()
# klijent.send('Welcome to Sports Bets 0-24!'.encode('utf-8'))



