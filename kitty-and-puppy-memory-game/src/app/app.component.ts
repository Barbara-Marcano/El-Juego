import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { CardData } from './card-data.model';
import { RestartDialogComponent } from './restart-dialog/restart-dialog.component';
import { LoserDialogComponent } from './loser-dialog/loser-dialog.component';
import { ThrowStmt } from '@angular/compiler';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  title(title: any) {
    throw new Error('Method not implemented.');
  }

  counter = 0;

  cardImages = [
    'Mv9hjnEUHR4',
    'eoqnr8ikwFE',
    'qEO5MpLyOks',
    'KZv7w34tluA',
    'cre553Zfmtg',
    'Zqy-x7K5Qcg',
    '61jg6zviI7I',
    'W9c6YicHKyE',
    'hhegBj6iJ5E',
    '9TMDgKSX5Ek',
    'P2igqqmbiKE',
    'p5lS8DT3tSQ',
    'yMSecCHsIBc',
    '7GX5aICb5i4',
    '7AIDE8PrvA0',
    'yJozLVBxNA0',
    'Dl39g6QhOIM',
    'HoC9ttceIGo',
    'fZ8uf_L52wg',
    'BHJs5TZ-Nt0',
    'E3LcqpQxtTU',
    'C26VKA9BMYQ',
    'WhHc2Z9XV9k',
    'HlI03bNHhBI'
  ];

  cards: CardData[] = [];

  flippedCards: CardData[] = [];

  matchedCount = 0;

  shuffleArray(anArray: any[]): any[] {
    return anArray.map(a => [Math.random(), a])
      .sort((a, b) => a[0] - b[0])
      .map(a => a[1]);
  }

  constructor(private dialog: MatDialog) {

  }

  ngOnInit(): void {
    this.setupCards();
  }

  setupCards(): void {
    this.cards = [];
    this.cardImages.forEach((image) => {
      const cardData: CardData = {
        imageId: image,
        state: 'default'
      };

      this.cards.push({ ...cardData });
      this.cards.push({ ...cardData });

    });

    this.cards = this.shuffleArray(this.cards);
  }

  cardClicked(index: number): void {
    const cardInfo = this.cards[index];

    if (cardInfo.state === 'default' && this.flippedCards.length < 2) {
      cardInfo.state = 'flipped';
      this.flippedCards.push(cardInfo);

      if (this.flippedCards.length > 1) {
        this.checkForCardMatch();
      }

    } //else if (cardInfo.state === 'flipped') {
    //   cardInfo.state = 'default';
    //   this.flippedCards.pop();

    // }
  }

  checkForCardMatch(): void {
    setTimeout(() => {
      const cardOne = this.flippedCards[0];
      const cardTwo = this.flippedCards[1];
      const nextState = cardOne.imageId === cardTwo.imageId ? 'matched' : 'default';
      cardOne.state = cardTwo.state = nextState;

      this.flippedCards = [];

      if (nextState === 'matched') {
        this.matchedCount++;

        if (this.matchedCount === this.cardImages.length) {
          const dialogRef = this.dialog.open(RestartDialogComponent, {
            disableClose: true
          });

          dialogRef.afterClosed().subscribe(() => {
            this.restart();
          });
        }
      }
      else {
        this.increaseCounter();
      }

    }, 1000);
  }

  increaseCounter(): void {
    this.counter++;
    if (this.counter <= 10) {
      let counterElement = document.getElementById("counter");
      counterElement.innerHTML = (this.counter).toString();

    }
    if (this.counter === 10) {
      const dialogRef = this.dialog.open(LoserDialogComponent, {
        disableClose: true
      });

      dialogRef.afterClosed().subscribe(() => {
        this.restart();
      });
    }
  }

  restart(): void {
    document.getElementById("counter").innerHTML = "0";
    this.counter = 0;
    this.matchedCount = 0;
    this.setupCards();
  }

}
