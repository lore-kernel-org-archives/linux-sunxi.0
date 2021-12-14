Received: from luna.linkmauve.fr (82-65-109-163.subs.proxad.net [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD22173
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Dec 2021 12:12:11 +0000 (UTC)
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id A5265F40D8A; Tue, 14 Dec 2021 13:02:48 +0100 (CET)
Date: Tue, 14 Dec 2021 13:02:48 +0100
From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
Subject: Empty IN_FORMATS in sun4i-drm
Message-ID: <20211214120248.y2zdzr5zsqowixjx@luna>
Jabber-ID: linkmauve@linkmauve.fr
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ybmuzoimcjw3vsl4"
Content-Disposition: inline


--ybmuzoimcjw3vsl4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

After updating Weston from 9f8561e9 to 07326040 (latest master), it
fails to run on my PinePhone saying =E2=80=9Cformat 0x34325258 not supporte=
d by
output DSI-1=E2=80=9D and then exiting.

This format is XR24, which would be extremely surprising not to be
present, and drm_info[1] says it is present.  Looking into Weston=E2=80=99s
code, I found that drm_plane_populate_formats()=E2=80=99s docstring says it=
 uses
=E2=80=9Ceither the IN_FORMATS blob property (if available), or the plane's
format list if not.=E2=80=9D  Looking back at drm_info, I saw said IN_FORMA=
TS
blob being empty of formats (while the format list is fully populated):
"IN_FORMATS" (immutable): blob =3D 32
=E2=94=94=E2=94=80=E2=94=80=E2=94=80DRM_FORMAT_MOD_LINEAR (0x0)

This makes me think the kernel should populate IN_FORMATS with at least
the same formats as the format list when supported, or stop advertising
this property altogether.

Other compositors (such as phoc) still run file, probably because they
use the format list exclusively, without consideration for modifiers.

Besides fixing this driver, would it make sense to also make Weston
ignore an empty IN_FORMATS and fall back to the format list?

Thanks,

[1] https://github.com/ascent12/drm_info

--=20
Emmanuel Gil Peyrot

--ybmuzoimcjw3vsl4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEjrVT1SzTln43kCLJOWgfYkb2LpAFAmG4h+UACgkQOWgfYkb2
LpDFygf/TaPrdn4BSPmRmf7XJgZ4Jq1UuuwPTO+u54uiyThDjun/u8mW2aAVCF2d
o5ypb3UChOtErClxIvsMi7MqtvP/zr0fKiWhM5tqrEq9y2+rqtpBgZvt9+gGsTRZ
wCdhQoVpcx9eZz5BRMNHmpGD+x4uBYDFKuSdoRq7267e5P4hXKOPxyjjRKneuCTY
XtzRrBTSiPrTnxxF3UkOvcK0uLdaUicswRiPPUQMk+kEpZvwAIywZYoENRpwOcOU
9l9sEJvMmEIaKF2s/on57GefTM2dh24e9z2jRBRAU4RFdr6NOhoG3IDIxqHaVXMJ
cz2MKuzhhUg+JYw99lGZlzWcpzKOFA==
=dzqn
-----END PGP SIGNATURE-----

--ybmuzoimcjw3vsl4--
