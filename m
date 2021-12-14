Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch [185.70.41.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1673968
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Dec 2021 16:40:06 +0000 (UTC)
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by mail-41103.protonmail.ch (Postfix) with ESMTPS id 4JD3rH2YrLz4x10B
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Dec 2021 16:34:55 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
	dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr header.b="Ge5gvQuc"
Date: Tue, 14 Dec 2021 16:34:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail; t=1639499678;
	bh=NcGZ1y9KpapF6MmfajVE3Ye80xHC5l2T2OHzUMpujYg=;
	h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
	 References:From:To:Cc;
	b=Ge5gvQuctu7HqkMhTqRCyxnBw+pnt+gTBnsUdJJqw0U5+WkKYr+51qNa3wmFT0U59
	 pHH/lx1sPNW3IdGWGtwbleFyFipv8ErxyOLPNa8R4ig2kmvKRRDv6IYIGwWhO4psgP
	 QnOS8+1tpvRqOggH/06fgdbLQ+7Lvj5fODiOXf4hEJrddNHNEhGyLKw6YOvGeC9JGV
	 8VnjWkDvsQQit2y+NnWUBQH3oo5n8KvC4u5PlLJKPtRSsTr/OIuvgkZxwMq1jNX8xD
	 52ouyBqWIXQv3VRBOI/Yr7oMLY7PEL5GIGXbsKpmUWg/j6rNVG9mybcQUsLAvhdNGx
	 NHHSIZn7aZQlw==
To: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
From: Simon Ser <contact@emersion.fr>
Cc: wayland-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: Empty IN_FORMATS in sun4i-drm
Message-ID: <MCCOIoUO_vL9v836xOv401aEkEwLKqNlb2g6tfxFP6qhgExfJGi0PoyIyTVwdRpZhHYT2QZlc6_bhLBYDWVDZGKYvrt5-USC8FfVwXZGLWo=@emersion.fr>
In-Reply-To: <Ybiu8jZEyRii44Dw@luna>
References: <Ybiu8jZEyRii44Dw@luna>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch

On Tuesday, December 14th, 2021 at 15:49, Emmanuel Gil Peyrot <linkmauve@li=
nkmauve.fr> wrote:

> This makes me think the kernel should populate IN_FORMATS with at least
> the same formats as the format list when supported, or stop advertising
> this property altogether.

Yup. This is a bug in the driver.

> Other compositors (such as phoc) still run file, probably because they
> use the format list exclusively, without consideration for modifiers.

phoc is based on wlroots, which falls back to its modifier-less codepath wh=
en
a driver is missing IN_FORMATS (or if it's empty). But it does support
modifier-aware buffer allocation as well.

> Besides fixing this driver, would it make sense to also make Weston
> ignore an empty IN_FORMATS and fall back to the format list?

I'd rather not, because this makes it more difficult to find buggy drivers.
