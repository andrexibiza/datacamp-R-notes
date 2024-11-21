from atproto import Client, models, AtUri
from datetime import datetime, timezone, timedelta

# --- USER INPUTS ---
HANDLE = "andrexibiza@gmail.com"  # Replace with your Bluesky handle
PASSWORD = "hahnah-redbe9-rypnaP"  # Replace with your Bluesky password

# Post creation inputs:
POST_TEXT = "This is a test post using the atproto library! #atproto #python"
DAYS_TO_BACKDATE = None  # Set to 0 for a regular post, > 0 to backdate by days
# OR
BACKDATED_DATETIME = datetime(2024, 3, 15, 10, 30, 0) # datetime(2024, 3, 15, 10, 30, 0, tzinfo=timezone.utc) # Example specific datetime (set DAYS_TO_BACKDATE to None if using this)

# Optional embed for new posts:
EMBED = None  # models.AppBskyEmbedImages(images=[models.AppBskyEmbedImages.Image(alt="My image", image={...})])

# Reply settings for new posts:
REPLY_TO_URI = None  # "at://did:plc:your_did/app.bsky.feed.post/your_rkey"


# Post editing inputs:
POST_TO_EDIT_URI = None  # "at://did:plc:your_did/app.bsky.feed.post/your_rkey"
NEW_POST_TEXT = None  # "This is the *edited* post text"
NEW_EMBED = None  # New embed for edited post, or None to keep existing embed


# --- END OF USER INPUTS ---

# --- Client Initialization ---
client = Client(user_agent='Python SDK', server='https://atproto.blue')

# --- Login ---
try:
    client.login(HANDLE, PASSWORD)
    print("Login successful!")
except Exception as e:
    print(f"Login failed: {e}")
    exit()

# --- Functions ---
def create_backdated_post(text, days_ago=None, backdated_datetime=None, embed=None, reply_to=None):
    if days_ago is not None and backdated_datetime is not None:
        raise ValueError("Provide either days_ago OR backdated_datetime, not both.")

    if days_ago is not None:
        now = datetime.now(timezone.utc)
        backdated_time = now - timedelta(days=days_ago)
        created_at = backdated_time.isoformat().replace("+00:00", "Z")
    elif backdated_datetime is not None:
        created_at = backdated_datetime.isoformat().replace("+00:00", "Z")
    else:
        created_at = datetime.now(timezone.utc).isoformat().replace("+00:00", "Z")

    post = models.AppBskyFeedPost.Record(text=text, created_at=created_at)

    if embed:
        post.embed = embed
    if reply_to:
        try:
            parent = client.app.bsky.feed.post.get(AtUri.from_str(reply_to).did, AtUri.from_str(reply_to).rkey)
            if parent.reply:
                post.reply = models.AppBskyFeedPost.ReplyRef(root=parent.reply.root, parent=parent.uri)
            else:
                post.reply = models.AppBskyFeedPost.ReplyRef(root=parent.uri, parent=parent.uri)
        except Exception as e:
            print(f"Error getting parent post for reply: {e}")
            return

    try:
        new_post = client.app.bsky.feed.post.create(client.me.did, post)
        print(f"Post created successfully: {new_post.uri}")
    except Exception as e:
        print(f"Error creating post: {e}")



def edit_post(post_uri, new_text, new_embed=None):
    try:
        at_uri = AtUri.from_str(post_uri)
        existing_post = client.app.bsky.feed.post.get(at_uri.did, at_uri.rkey)
    except Exception as e:
        print(f"Error fetching post: {e}")
        return

    updated_post = models.AppBskyFeedPost.Record(text=new_text, created_at=existing_post.created_at)
    if new_embed:
        updated_post.embed = new_embed
    elif new_embed is not None:  # Explicitly setting new_embed to None removes existing embed
        updated_post.embed = None

    try:
        updated_record = client.app.bsky.feed.post.put(client.me.did, at_uri.rkey, updated_post)
        print(f"Post updated successfully: {updated_record.uri}")
    except Exception as e:
        print(f"Error updating post: {e}")



# --- Main execution block ---
if __name__ == "__main__":
    if POST_TEXT:
        create_backdated_post(POST_TEXT, days_ago=DAYS_TO_BACKDATE, backdated_datetime=BACKDATED_DATETIME, embed=EMBED, reply_to=REPLY_TO_URI)

    if POST_TO_EDIT_URI and NEW_POST_TEXT:
        edit_post(POST_TO_EDIT_URI, NEW_POST_TEXT, new_embed=NEW_EMBED)
