public static int main (string[] args) {
	Cancellable cancellable = new Cancellable ();
	// Use cancellable.cancel () to abort the resolution

	Soup.Address address = new Soup.Address ("www.gnome.org", 80);
	uint status = address.resolve_sync (cancellable);

	switch (status) {
	case Soup.Status.OK:
		stdout.printf ("Resolved! %s\n", address.get_physical ());
		break;

	case Soup.Status.CANT_RESOLVE:
		stdout.printf ("Error: Unable to resolve destination host name.\n");
		break;

	case Soup.Status.CANCELLED:
		stdout.printf ("Error: Message was cancelled locally.\n");
		break;

	default:
		assert_not_reached ();
	}

	return 0;
}
