Received: from m101-out-mua-6.websupport.se (m101-out-mua-6.websupport.se [109.235.175.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC35A3203B6
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jul 2026 16:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.235.175.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784566022; cv=none; b=BhruPEgju17H3ce/7Vlc0obMZH0FMO1KkBXAtuPugtoN7TuTRCWKuWdSpcA40MkkZuWwW41xkeMGthz7ddp1GnX1hGQQgk0gCRvjqVRunWffg4O08Ixbq6WbIvADXHtUUQ+LeOcXngtlAuHLWrzhZ7+LUBvdnIpBrpb+3mDZgqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784566022; c=relaxed/simple;
	bh=RTe5ej6XGwXH3vF2Gs/Z0SOnGtz92K2DY3izKnycdu0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CGjOoqKMitWaEtcofcwHDITjylCVtBHF6PHRtvyAL7SRyFHGINI5HKshZcZK8R99EpK5b6BsoWtyIsKtuCIMihpb6eVOh3yG+/yy0LqHQoh15Vlg5dRHs/gBvDErwU7EUM6xzSM76fdgH5osdNMf/wbwnTEcN2zMgZRokbk10n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=palvencia.se; spf=pass smtp.mailfrom=palvencia.se; dkim=pass (2048-bit key) header.d=palvencia.se header.i=@palvencia.se header.b=qZe0qHGW; arc=none smtp.client-ip=109.235.175.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=palvencia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=palvencia.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=palvencia.se header.i=@palvencia.se header.b="qZe0qHGW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=palvencia.se;
	s=mail; t=1784566013;
	bh=GqGKoMyp6zz7p6qJgkYxp+MeFclOmF1BYBbUzO+9Wew=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qZe0qHGWs4+esPCeXr1DxDwgQJer5FJrOGGtofhjO+5oS/5IBi9TscKZY2BJzR4Tx
	 X4eFZ05osU/ls1p8S92YKFLzJJ+1mPWz3f/0tlUlFnWd9EaDarvrhwQSc388PTj87A
	 ytBBxbU7oleKD1jwSJ7s5tYD8ddL362Y03Aq/eiQT0uI9E1wbYCV+9/sNN9kSEEnX5
	 rZbe5iX7pPtmecroYTTC2th1L58RvKYIuxwLS6sSX2Ev/4meU7LjQxtnXzqRvqiRkx
	 i269TH1GcLEp6pYhwIhdwVp1FbY3j8ywaimyx+jl52yHdZc1WZ/+0J+AfUR+/ia3Jk
	 QBXATdUXzD0Kw==
Received: from m101-u6-ing.websupport.se (unknown [10.30.6.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by m101-out-mua-6.websupport.se (Postfix) with ESMTPS id 4h3md92vTPzNBj;
	Mon, 20 Jul 2026 18:46:53 +0200 (CEST)
X-Authenticated-Sender: per@palvencia.se
Authentication-Results: m101-u6-ing.websupport.se;
	auth=pass smtp.auth=per@palvencia.se smtp.mailfrom=per@palvencia.se
Received: from rpi (unknown [193.180.91.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: per@palvencia.se)
	by m101-u6-ing.websupport.se (Postfix) with ESMTPSA id 4h3md76qsMzYWR;
	Mon, 20 Jul 2026 18:46:51 +0200 (CEST)
Date: Mon, 20 Jul 2026 18:46:24 +0200
From: Per Larsson <per@palvencia.se>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Allwinner sunXi SoC
 support" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Allwinner
 sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC] arm64: dts: allwinner: a523: Add SPDIF to
 x96qproplus device
Message-ID: <20260720184625.2609093d@rpi>
In-Reply-To: <CAGb2v64rRipC9VV5QyHC0nR4rAho8q=wX0ngVVxRND3xMOnofA@mail.gmail.com>
References: <20260719030927.2417-1-per@palvencia.se>
	<CAGb2v64rRipC9VV5QyHC0nR4rAho8q=wX0ngVVxRND3xMOnofA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Out-Spamd-Result: default: False [1.90 / 1000.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_COUNT_ZERO(0.00)[0];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[dt];
	ARC_NA(0.00)[];
	BAYES_HAM(0.00)[56.27%];
	ASN(0.00)[asn:35790, ipnet:193.180.91.0/24, country:SE];
	HAS_X_AS(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev]
X-Rspamd-Action: no action
X-Out-Rspamd-Queue-Id: 4h3md76qsMzYWR
X-Out-Rspamd-Server: m101-rspamd-out-4
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-purgate-size: 1329
X-purgate-ID: 155908::1784566013-3D7071C6-706EAE78/0/0

On Mon, 20 Jul 2026 22:59:57 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

> On Sun, Jul 19, 2026 at 11:10=E2=80=AFAM Per Larsson <per@palvencia.se> w=
rote:
> >
> >
> > Signed-off-by: Per Larsson <per@palvencia.se>
> > ---
> > Marking this as RFC for a few reasons
> > 1. This is my first submission, hoping everything is properly
> > organized. =20
>=20
> This is pretty good. The commit message is also well written. I would
> like to see the patch split into two patches though. The first adds
> the pinmux (and you can mention in the commit message that a
> subsequent patch will reference it). The second patch enables SPDIF
> on the device you have.
>=20
Ok, will split into two patches.

> > 2. My testing setup is not the best: I get sound with this patch,
> > but the pulseaudio daemon needs to be restarted far too often.
> >    Hopefully it's just something on this minirootfs. Testing
> > welcome. 3. Not sure where to get the hash for a fixes tag or if
> > that's even OK =20
>=20
> This is a new addition, not a fix, so no fixes tag is warranted.
>=20
Understood.

Also saw that issue #2 in the list above was indeed because of issues in
my rootfs and not because of anything related to the patch, so no more
RFC-markings for next version.
>=20
> Thanks
> ChenYu
>=20
> > ---
