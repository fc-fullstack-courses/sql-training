import _ from 'lodash';
import generationConfig from '../configs/generation.json' assert { type: 'json' };

const {
  ratings: { minRating, maxRating },
  reviews: {
    reviewChance,
    descriptions: { positive, negative, neutral },
    ratingThresholds: { maxNegative, minPositive },
  },
} = generationConfig;

export const generateReviewsMap = (orders, ordersWithProductsResults) => {
  const reviewsMap = new Map();

  let currentReviewId = 1;

  for (const order of orders) {
    for (const owp of ordersWithProductsResults) {
      if (owp.order_id === order.id && _.random(0, 100) <= reviewChance) {
        const rating = _.random(minRating, maxRating, true);

        let description;

        if (rating <= maxNegative) {
          description = negative[_.random(0, negative.length - 1)];
        } else if (rating >= minPositive) {
          description = positive[_.random(0, positive.length - 1)];
        } else {
          description = neutral[_.random(0, neutral.length - 1)];
        }

        const fullReviewObj = {
          userId: order.user_id,
          productId: owp.product_id,
          orderId: order.id,
          description,
          reviewId: currentReviewId,
          ratingId: currentReviewId,
          rating,
        };

        currentReviewId++;

        if (reviewsMap.has(order.id)) {
          const orderReviewsArr = reviewsMap.get(order.id);

          orderReviewsArr.push(fullReviewObj);
        } else {
          reviewsMap.set(order.id, [fullReviewObj]);
        }
      }
    }
  }

  return reviewsMap;
};

const generateReviewInsert = (review) =>
  `(${review.userId}, ${review.productId}, ${review.ratingId}, '${review.description}')`;

export const mapReviews = (reviewsMap) => {
  const reviewsArr = [];

  for (const orderReviewsArr of reviewsMap.values()) {
    const orderReviewsString = orderReviewsArr
      .map((review) => generateReviewInsert(review))
      .join(',');

    reviewsArr.push(orderReviewsString);
  }

  return reviewsArr.join(',');
};

const generateRatingInsert = (review) =>
  `(${review.reviewId}, ${review.rating})`;

export const mapRatings = (reviewsMap) => {
  const ratingsArr = [];

  for (const orderReviewsArr of reviewsMap.values()) {
    const orderRatingsString = orderReviewsArr
      .map((review) => generateRatingInsert(review))
      .join(',');

    ratingsArr.push(orderRatingsString);
  }

  return ratingsArr.join(',');
};
