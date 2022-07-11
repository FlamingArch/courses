# region Tweepy Imports
from tweepy import API
from tweepy import Cursor
from tweepy.streaming import StreamListener
from tweepy import OAuthHandler, auth
from tweepy import Stream
# endregion

# region Credentials
# Create a file 'twitter_credentials.py' with the following variables:
# API_KEY = ""
# API_KEY_SECRET = ""
# BEARER_TOKEN = ""
# ACCESS_TOKEN = ""
# ACCESS_TOKEN_SECRET = ""
# CONSUMER_KEY = API_KEY
# CONSUMER_SECRET = API_KEY_SECRET
# Place it in root directory so it can be imported.
import twitter_credentials
# endregion

# region Boolean Case Fixing
# To avoid annoying case issues when typing boolean variables.
true = True
false = False
# endregion

debug_mode = True


class TwitterClient():
    def __init__(self) -> None:
        self.auth = TwitterAuthenticator().authenticate_twitter_app()
        if debug_mode:
            print("Authentication successful.")
        self.twitter_client = API(self.auth)

    def get_user_timeline_tweets(self, num_tweets):
        tweets = []
        if debug_mode: 
            print("Fetching tweets.")
        for tweet in Cursor(self.twitter_client.user_timeline).items(num_tweets):
            print("Getting Tweet...")
            print(tweet.text)
            tweets.append(tweet)
        return tweets


class TwitterAuthenticator():
    """
    Class to authenticate with Twitter's API.
    """

    def authenticate_twitter_app(self):
        """
        Authenticate with Twitter's API.
        """
        auth = OAuthHandler(twitter_credentials.CONSUMER_KEY,
                            twitter_credentials.CONSUMER_SECRET)
        auth.set_access_token(twitter_credentials.ACCESS_TOKEN,
                              twitter_credentials.ACCESS_TOKEN_SECRET)
        return auth


class TwitterStreamer:
    """
    Class for streaming and processing live tweets.
    """

    def __init__(self) -> None:
        self.twitter_authenticator = TwitterAuthenticator()

    def stream_tweets(self, filename, hashtags=[]):
        # This handles twitter authentication and
        # connection to Twitter Streaming API
        self.hashtags = hashtags
        auth = self.twitter_authenticator.authenticate_twitter_app()
        listener = TwitterListener(filename)

        stream = Stream(auth, listener)
        stream.filter(track=hashtags)


class TwitterListener(StreamListener):
    """
    Basic Listener class that prints tweets to stdouts.
    """

    def __init__(self, filename, debug=debug_mode):
        self.debug = debug
        self.filename = filename

    def on_data(self, data):
        try:
            if self.debug:
                print(data)
            with open(self.filename, 'a') as stream:
                stream.write(data)
        except BaseException as e:
            print(f"Error on_data: {e}")

        return True
        # return super().on_data(data)

    def on_error(self, status):
        if status == '420':
            # Returning False on_data method in case rate limit occurs.
            return False
        print(status)
        # return super().on_error(status)


if __name__ == "__main__":
    hash_tag_list = [
        "donald trump",
        "hilary clinton",
        "barack obama",
        "bernie sanders"
    ]
    fetched_tweets_filename = "tweets.json"
    twitter_client = TwitterClient()
    print(twitter_client.get_user_timeline_tweets(2))
    # twitter_streamer = TwitterStreamer()
    # twitter_streamer.stream_tweets(fetched_tweets_filename, hash_tag_list)
    # raise "Module not executable, import and run inside another module"
