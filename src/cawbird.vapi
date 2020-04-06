/* cawbird.vapi generated by valac 0.38.7, do not modify. */

namespace TweetUtils {
	[CCode (cheader_filename = "cawbird.h")]
	public static GLib.Error failed_request_to_error (Rest.ProxyCall call, GLib.Error e);
	[CCode (cheader_filename = "cawbird.h")]
	public static void handle_media_click (Cb.Media[] media, MainWindow window, int index, double px = 0.0, double py = 0.0);
	[CCode (cheader_filename = "cawbird.h")]
	public static void sort_entities (ref Cb.TextEntity[] entities);
}
namespace Utils {
	[CCode (cheader_filename = "cawbird.h")]
	public static Cb.Filter create_persistent_filter (string content, Account account);
	[CCode (cheader_filename = "cawbird.h")]
	public static async void download_file (string url, GLib.OutputStream out_stream);
	[CCode (cheader_filename = "cawbird.h")]
	public static string get_media_display_name (Cb.Media media);
	[CCode (cheader_filename = "cawbird.h")]
	public static string get_time_delta (GLib.DateTime time, GLib.DateTime now);
	[CCode (cheader_filename = "cawbird.h")]
	public static void init_soup_session ();
	[CCode (cheader_filename = "cawbird.h")]
	public static void load_custom_css ();
	[CCode (cheader_filename = "cawbird.h")]
	public static void load_custom_icons ();
	[CCode (cheader_filename = "cawbird.h")]
	public static void update_startup_account (string old_screen_name, string new_screen_name);
	[CCode (cheader_filename = "cawbird.h")]
	public static bool usable_json_value (Json.Object node, string value_name);
}
namespace Dirs {
	[CCode (cheader_filename = "cawbird.h")]
	public static string config (string path);
	[CCode (cheader_filename = "cawbird.h")]
	public static void create_dirs ();
}
namespace ListUtils {
}
namespace UserUtils {
}
namespace Benchmark {
	[CCode (cheader_filename = "cawbird.h")]
	public class Bench {
		public GLib.DateTime first;
		public string name;
		public Bench ();
		public void stop ();
	}
	[CCode (cheader_filename = "cawbird.h")]
	public static Benchmark.Bench start (string name);
}
namespace Sql {
	[CCode (cheader_filename = "cawbird.h")]
	public class Database : GLib.Object {
		public Database (string filename, string init_file, int max_version);
		public void begin_transaction ();
		public void end_transaction ();
		public void exec (string sql, Sqlite.Callback? callback = null);
		public unowned Sqlite.Database get_sqlite_db ();
		public Sql.InsertStatement insert (string table_name);
		public Sql.InsertStatement replace (string table_name);
		public Sql.SelectStatement select (string table_name);
		public Sql.UpdateStatement update (string table_name);
	}
	[CCode (cheader_filename = "cawbird.h")]
	public class InsertStatement : GLib.Object {
		public weak Sqlite.Database db;
		public InsertStatement (string table_name, bool replace = false);
		public int64 run ();
		public Sql.InsertStatement val (string col_name, string col_value);
		public Sql.InsertStatement valb (string col_name, bool col_value);
		public Sql.InsertStatement vali (string col_name, int col_value);
		public Sql.InsertStatement vali64 (string col_name, int64 col_value);
	}
	[CCode (cheader_filename = "cawbird.h")]
	public class SelectStatement : GLib.Object {
		public weak Sqlite.Database db;
		public SelectStatement (string table_name);
		public Sql.SelectStatement cols (string first, ...);
		public Sql.SelectStatement limit (int limit);
		public Sql.SelectStatement nocase ();
		public int64 once_i64 ();
		public string? once_string ();
		public Sql.SelectStatement or ();
		public Sql.SelectStatement order (string order_by);
		public int run (Sql.SelectCallback callback);
		public Sql.SelectStatement where (string stmt);
		public Sql.SelectStatement where_eqi (string w, int64 v);
		public Sql.SelectStatement where_prefix (string field, string prefix);
		public Sql.SelectStatement where_prefix2 (string field, string prefix);
	}
	[CCode (cheader_filename = "cawbird.h")]
	public class UpdateStatement : GLib.Object {
		public weak Sqlite.Database db;
		public UpdateStatement (string table_name);
		public int64 run ();
		public Sql.UpdateStatement val (string col_name, string col_value);
		public Sql.UpdateStatement valb (string col_name, bool col_value);
		public Sql.UpdateStatement vali (string col_name, int col_value);
		public Sql.UpdateStatement vali64 (string col_name, int64 col_value);
		public Sql.UpdateStatement where (string where);
		public Sql.UpdateStatement where_eq (string col, string value);
		public Sql.UpdateStatement where_eqi (string col, int64 iv);
	}
	[CCode (cheader_filename = "cawbird.h")]
	public delegate bool SelectCallback (string[] vals);
	[CCode (cheader_filename = "cawbird.h")]
	public const string ACCOUNTS_INIT_FILE;
	[CCode (cheader_filename = "cawbird.h")]
	public const int ACCOUNTS_SQL_VERSION;
	[CCode (cheader_filename = "cawbird.h")]
	public const string CAWBIRD_INIT_FILE;
	[CCode (cheader_filename = "cawbird.h")]
	public const int CAWBIRD_SQL_VERSION;
}
[CCode (cheader_filename = "cawbird.h")]
public enum MediaVisibility {
	SHOW,
	HIDE,
	HIDE_IN_TIMELINES
}
[CCode (cheader_filename = "cawbird.h")]
public class Cawbird : Gtk.Application {
	public static Sql.Database db;
	public static Cb.SnippetManager snippet_manager;
	public Cawbird ();
	public override void activate ();
	public void add_window_for_account (Account account);
	public bool add_window_for_screen_name (string screen_name);
	public override int command_line (GLib.ApplicationCommandLine cmd);
	public bool is_window_open_for_screen_name (string screen_name, out MainWindow? window = null);
	public bool is_window_open_for_user_id (int64 user_id, out MainWindow? window = null);
	public override void shutdown ();
	public void start_account (Account acc);
	public override void startup ();
	public void stop_account (Account acc);
	public signal void account_added (Account acc);
	public signal void account_removed (Account acc);
	public signal void account_window_changed (int64? old_id, int64 new_id);
}
[CCode (cheader_filename = "cawbird.h")]
public class MainWindow : Gtk.ApplicationWindow {
	public weak Account? account;
	public Gtk.Button back_button;
	public Gtk.ToggleButton compose_tweet_button;
	public MainWidget main_widget;
	public MainWindow (Gtk.Application app, Account? account = null);
	public void change_account (Account? account);
	public IPage get_page (int page_id);
	public void mark_tweet_as_read (int64 tweet_id);
	public void reply_to_tweet (int64 tweet_id);
	public void rerun_filters ();
	public void save_geometry ();
	public void set_window_title (string title, Gtk.StackTransitionType transition_type = Gtk.StackTransitionType.NONE);
	public int cur_page_id { get; }
}
[CCode (cheader_filename = "cawbird.h")]
public class MainWidget : Gtk.Box {
	public MainWidget (Account account, MainWindow parent, Cawbird app);
	public IPage get_page (int page_id);
	public void remove_current_page ();
	public void stop ();
	public void switch_page (int page_id, Cb.Bundle? args = null);
	public int cur_page_id { get; }
}
[CCode (cheader_filename = "cawbird.h")]
public class Account : GLib.Object {
	public string avatar_url;
	public string? banner_url;
	public int64[] blocked;
	public Sql.Database db;
	public string? description;
	public int64[] disabled_rts;
	public GLib.GenericArray<Cb.Filter> filters;
	public int64[] friends;
	public int64 id;
	public int64[] muted;
	public string name;
	public NotificationManager notifications;
	public Rest.OAuthProxy proxy;
	public string screen_name;
	public Cb.UserCounter user_counter;
	public Cb.UserStream user_stream;
	public string? website;
	public const string DUMMY;
	public Account (int64 id, string screen_name, string name);
	public static void add_account (Account acc);
	public void add_disabled_rts_id (int64 user_id);
	public void add_filter (owned Cb.Filter f);
	public void block_id (int64 id);
	public bool blocked_or_muted (int64 user_id);
	public bool filter_matches (Cb.Tweet t);
	public void follow_id (int64 user_id);
	public bool follows_id (int64 user_id);
	public static uint get_n ();
	public static Account get_nth (uint index);
	public void init_database ();
	public async void init_information ();
	public void init_proxy (bool load_secrets = true, bool force = false);
	public bool is_blocked (int64 user_id);
	public bool is_muted (int64 user_id);
	public void load_avatar ();
	public void mute_id (int64 id);
	public static unowned Account? query_account (string screen_name);
	public static unowned Account? query_account_by_id (int64 id);
	public async void query_user_info_by_screen_name (string? screen_name = null);
	public static void remove_account (string screen_name);
	public void remove_disabled_rts_id (int64 user_id);
	public void save_info ();
	public void set_blocked (Json.Array blocked_array);
	public void set_disabled_rts (Json.Array disabled_rts_array);
	public void set_friends (Json.Array friends_array);
	public void set_muted (Json.Array muted_array);
	public void set_new_avatar (Cairo.Surface new_avatar);
	public void unblock_id (int64 id);
	public void unfollow_id (int64 user_id);
	public void uninit ();
	public void unmute_id (int64 id);
	public Cairo.Surface avatar { get; set; }
	public Cairo.Surface avatar_small { get; set; }
	public signal void info_changed (string screen_name, string name, Cairo.Surface avatar_small, Cairo.Surface avatar);
}
[CCode (cheader_filename = "cawbird.h")]
public class HomeTimeline : Cb.MessageReceiver, DefaultTimeline {
	public HomeTimeline (int id, Account account);
	public override void create_radio_button (Gtk.RadioButton? group);
	public override string get_title ();
	public void hide_retweets_from (int64 user_id, Cb.TweetState reason);
	public void hide_tweets_from (int64 user_id, Cb.TweetState reason);
	public void show_retweets_from (int64 user_id, Cb.TweetState reason);
	public void show_tweets_from (int64 user_id, Cb.TweetState reason);
	protected override string function { get; }
}
[CCode (cheader_filename = "cawbird.h")]
public abstract class DefaultTimeline : ScrollWidget, IPage {
	public weak Account account;
	protected bool initialized;
	protected Gtk.Widget? last_focus_widget;
	protected bool loading;
	protected weak MainWindow main_window;
	protected BadgeRadioButton radio_button;
	public TweetListBox tweet_list;
	protected uint tweet_remove_timeout;
	public const int REST;
	public DefaultTimeline (int id);
	public virtual void create_radio_button (Gtk.RadioButton? group);
	public void delete_tweet (int64 tweet_id);
	public override void destroy ();
	protected Cb.TweetState get_rt_flags (Cb.Tweet t);
	public abstract string get_title ();
	protected void handle_scrolled_to_start ();
	public void load_newest ();
	protected async void load_newest_internal ();
	public void load_older ();
	protected async void load_older_internal ();
	protected void mark_seen (int64 id);
	protected void mark_seen_on_scroll (double value);
	public virtual void on_join (int page_id, Cb.Bundle? args);
	public virtual void on_leave ();
	public void rerun_filters ();
	protected bool scroll_up (Cb.Tweet t);
	public void toggle_favorite (int64 id, bool mode);
	protected abstract string function { get; }
	public int unread_count { get; set; }
}
[CCode (cheader_filename = "cawbird.h")]
public class Settings : GLib.Object {
	public Settings ();
	public static void add_text_transform_flag (Cb.TransformFlags flag);
	public static bool auto_scroll_on_new_tweets ();
	public static new GLib.Settings @get ();
	public static string get_accel (string accel_name);
	public static string get_consumer_key ();
	public static string get_consumer_secret ();
	public static MediaVisibility get_media_visiblity ();
	public static Cb.TransformFlags get_text_transform_flags ();
	public static int get_tweet_stack_count ();
	public static bool hide_nsfw_content ();
	public static void init ();
	public static double max_media_size ();
	public static bool notify_new_dms ();
	public static bool notify_new_mentions ();
	public static void remove_text_transform_flag (Cb.TransformFlags flag);
	public static void toggle_topbar_visible ();
	public static bool use_dark_theme ();
}
[CCode (cheader_filename = "cawbird.h")]
public class NotificationManager : GLib.Object {
	public NotificationManager (Account account);
	public string send (string summary, string body, string? id_suffix = null);
	public string send_dm (int64 sender_id, string? existing_id, string summary, string text);
	public void withdraw (string id);
}
[CCode (cheader_filename = "cawbird.h")]
public class Twitter : GLib.Object {
	public static Cairo.Surface no_avatar;
	public static Gdk.Pixbuf no_banner;
	public const int MAX_BYTES_PER_IMAGE;
	public const int max_media_per_upload;
	public const int short_url_length;
	public static new Twitter @get ();
	public async void get_avatar (int64 user_id, string url, AvatarWidget dest_widget, int size = 48, bool force_download = false);
	public Cairo.Surface get_cached_avatar (int64 user_id);
	public bool has_avatar (int64 user_id);
	public void init ();
	public async Cairo.Surface? load_avatar_for_user_id (Account account, int64 user_id, int size);
	public void ref_avatar (Cairo.Surface surface);
	public void unref_avatar (Cairo.Surface surface);
}
[CCode (cheader_filename = "cawbird.h")]
public class DMManager : GLib.Object {
	public DMManager ();
	public DMManager.for_account (Account account);
	public GLib.ListModel get_threads_model ();
	public bool has_thread (int64 user_id);
	public void insert_message (Json.Object dm_obj);
	public void load_cached_threads ();
	public async void load_newest_dms ();
	public string? reset_notification_id (int64 user_id);
	public int reset_unread_count (int64 user_id);
	public bool empty { get; }
	public signal void message_received (DMThread thread, string text, bool initial);
	public signal void thread_changed (DMThread thread);
}
[CCode (cheader_filename = "cawbird.h")]
public class TweetListBox : Gtk.ListBox {
	public weak Account account;
	public Cb.DeltaUpdater delta_updater;
	public Cb.TweetModel model;
	public TweetListBox ();
	public Gtk.Widget? get_first_visible_row ();
	public Gtk.Stack? get_placeholder ();
	public void remove_all ();
	public void reset_placeholder_text ();
	public void set_empty ();
	public void set_error (string err_msg);
	public void set_placeholder_text (string text);
	public void set_unempty ();
	public TweetListEntry? action_entry { get; }
	public signal void retry_button_clicked ();
}
[CCode (cheader_filename = "cawbird.h")]
public class ScrollWidget : Gtk.ScrolledWindow {
	public ScrollWidget ();
	public void balance_next_upper_change (int mode);
	public void scroll_down_next (bool animate = true, bool force_wait = false);
	public void scroll_up_next (bool animate = true, bool force_start = false);
	public double end_diff { get; set; }
	public bool scrolled_down { get; }
	public bool scrolled_up { get; }
	public signal void scrolled_to_end ();
	public signal void scrolled_to_start (double value);
}
[CCode (cheader_filename = "cawbird.h")]
public class TextButton : Gtk.Button {
	public TextButton ();
	public void set_text (string text);
}
[CCode (cheader_filename = "cawbird.h")]
public class BadgeRadioButton : Gtk.RadioButton {
	public BadgeRadioButton (Gtk.RadioButton group, string icon_name, string text = "");
	public override bool draw (Cairo.Context ct);
	public bool show_badge { get; set; }
}
[CCode (cheader_filename = "cawbird.h")]
public class ReplyIndicator : Gtk.Widget {
	public ReplyIndicator ();
	public override bool draw (Cairo.Context ct);
	public override void get_preferred_height_for_width (int width, out int min_height, out int nat_height);
	public override Gtk.SizeRequestMode get_request_mode ();
	public bool replies_available { get; set; }
}
[CCode (cheader_filename = "cawbird.h")]
public class MultiMediaWidget : Gtk.Box {
	public bool restrict_height;
	public weak Gtk.Window window;
	public const int MAX_HEIGHT;
	public MultiMediaWidget ();
	public void set_all_media (Cb.Media[] medias);
	public void set_media (int index, Cb.Media media);
	public signal void media_clicked (Cb.Media m, int index, double px, double py);
	public signal void media_invalid ();
}
[CCode (cheader_filename = "cawbird.h")]
public class AvatarWidget : Gtk.Widget {
	public AvatarWidget ();
	public override bool draw (Cairo.Context ctx);
	public override void get_preferred_height (out int min, out int nat);
	public override void get_preferred_width (out int min, out int nat);
	public override void size_allocate (Gtk.Allocation alloc);
	public bool make_round { get; set; }
	public bool overlap { get; set; }
	public int size { get; set; }
	public Cairo.Surface surface { get; set; }
	public bool verified { get; set; }
}
[CCode (cheader_filename = "cawbird.h")]
public class AvatarBannerWidget : Gtk.Container {
	public AvatarBannerWidget ();
	public override void add (Gtk.Widget w);
	public override bool draw (Cairo.Context ct);
	public override void forall_internal (bool include_internals, Gtk.Callback cb);
	public override void get_preferred_height_for_width (int width, out int min, out int nat);
	public override void get_preferred_width (out int min, out int nat);
	public override Gtk.SizeRequestMode get_request_mode ();
	public override void remove (Gtk.Widget w);
	public void set_account (Account account);
	public void set_avatar (Gdk.Pixbuf avatar);
	public void set_banner (Gdk.Pixbuf banner);
	public override void size_allocate (Gtk.Allocation allocation);
	public signal void avatar_changed (Gdk.Pixbuf new_avatar);
	public signal void avatar_clicked ();
	public signal void banner_changed (Gdk.Pixbuf new_banner);
	public signal void banner_clicked ();
}
[CCode (cheader_filename = "cawbird.h")]
public class LazyMenuButton : Gtk.ToggleButton {
	public LazyMenuButton ();
	public override void clicked ();
	public GLib.Menu menu_model { get; set; }
}
[CCode (cheader_filename = "cawbird.h")]
[GtkTemplate (ui = "/uk/co/ibboard/cawbird/ui/tweet-list-entry.ui")]
public class TweetListEntry : Cb.TwitterItem, Gtk.ListBoxRow {
	public Cb.Tweet tweet;
	public TweetListEntry (Cb.Tweet tweet, MainWindow? main_window, Account account, bool restrict_height = false);
	public void fade_in ();
	public void set_avatar (Cairo.Surface surface);
	public void toggle_mode ();
	public bool read_only { set; }
	public bool shows_actions { get; }
}
[CCode (cheader_filename = "cawbird.h")]
[GtkTemplate (ui = "/uk/co/ibboard/cawbird/ui/list-list-entry.ui")]
public class ListListEntry : Gtk.ListBoxRow {
	public int64 created_at;
	public string creator_screen_name;
	public int64 id;
	public string mode;
	public int n_members;
	public int n_subscribers;
	public bool user_list;
	public ListListEntry ();
	public ListListEntry.from_json_data (Json.Object obj, Account account);
	public static int sort_func (Gtk.ListBoxRow r1, Gtk.ListBoxRow r2);
	public string description { get; set; }
	public string name { get; set; }
}
[CCode (cheader_filename = "cawbird.h")]
[GtkTemplate (ui = "/uk/co/ibboard/cawbird/ui/account-dialog.ui")]
public class AccountDialog : Gtk.Window {
	public AccountDialog (Account account);
	public override void destroy ();
}
[CCode (cheader_filename = "cawbird.h")]
public class Collect : GLib.Object {
	public Collect (int max);
	public void emit (GLib.Error? error = null);
	public bool done { get; }
	public signal void finished (GLib.Error? error);
}
[CCode (cheader_filename = "cawbird.h")]
public class DMThread : GLib.Object {
	public Cairo.Surface? avatar_surface;
	public string last_message;
	public int64 last_message_id;
	public string? notification_id;
	public int unread_count;
	public Cb.UserIdentity user;
	public DMThread ();
	public async void load_avatar (Account account, int scale_factor);
}
[CCode (cheader_filename = "cawbird.h")]
public class DMThreadsModel : GLib.ListModel, GLib.Object {
	public DMThreadsModel ();
	public void add (DMThread thread);
	public DMThread? get_thread (int64 user_id);
	public bool has_thread (int64 user_id);
	public void increase_unread_count (int64 user_id, int amount = 1);
	public string? reset_notification_id (int64 user_id);
	public int reset_unread_count (int64 user_id);
	public void update_last_message (int64 sender_id, int64 message_id, string message_text);
}
[CCode (cheader_filename = "cawbird.h")]
public interface IPage : Gtk.Widget {
	public abstract void create_radio_button (Gtk.RadioButton? group);
	public virtual void double_open ();
	public abstract Gtk.RadioButton? get_radio_button ();
	public abstract string get_title ();
	public virtual bool handles_double_open ();
	public abstract void on_join (int page_id, Cb.Bundle? args);
	public abstract void on_leave ();
	public abstract int id { get; set; }
	public abstract MainWindow window { set; }
}
[CCode (cheader_filename = "cawbird.h")]
public static unowned string __class_name (GLib.Object o);
