Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BCC188596
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Dec 2024 21:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734902435; cv=none; b=l1tg8uoW12T+6A9KRtx641khrb+crkHOwUNfY0fjeZc+XZ+iJIk1RW/mN8SY2MCK3IY9ANmE92tIDLQL6fv1x0sgZbJL6lXmiW7bDlVum6CTiukvlNxy+xL+YHyK9urvuPZX8EQsRifJlTAcRqRXZJBBoQIy45OOVLbVI/sfglI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734902435; c=relaxed/simple;
	bh=FiGv+5ysP4gIc+P0kSyoPBiyHVZ772181dW034ip27I=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ibS9OLwUEtQCMhyb2hYiXZ3Mwu8PQYYBHYnB2tJTWad+hEaOY/+uf/52ePUoVL9poHD1EKAnZBIkxtBUaqZxlfhLkbZVNv9Q/hMrdHeZgTdhdWqB9Odf3XLIYzxvoNiqduUIs1r1srJanH+2Oy66uit3MTgs1gJftDByKOZVEl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=NEfqJ7zS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Z34rux4H; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="NEfqJ7zS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Z34rux4H"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 984E013801B6;
	Sun, 22 Dec 2024 16:20:32 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-04.internal (MEProxy); Sun, 22 Dec 2024 16:20:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1734902432; x=1734988832; bh=ONFj4qGyvB5Vc06y2mU0omsDA8ywA9Lq
	YdH+Ls8UtDc=; b=NEfqJ7zSpS/vln3CGIJ/0kJAP41tUliKx4fCh0YaJd9J0h6E
	kIjeRdkAX9ozv+C44ol9xUvQqICqLbIAKDjccqpRc6zajfjIHUtzFSyErTq3biSd
	BGzcWaoVrrlgTn0FkRPnLoPTu8md1KoogGclhDrxs9Vi/TqKSH6fdhfjC2hubiZK
	p71A2F46K7dV0JUH+tGAlpbHaSD6hjpUmctTSelgFMAghzAfrnVnHXHxkTrZSKwa
	q6lAJDols5jN7FqoClUFMqDRxqu2LXl2nvZDFSizvSgqd3y9KIlYQitNlLq4pFxn
	Uw6kyH9h1d9/5yiAJamX7BgSGn6qCh1cAvGwpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1734902432; x=
	1734988832; bh=ONFj4qGyvB5Vc06y2mU0omsDA8ywA9LqYdH+Ls8UtDc=; b=Z
	34rux4HRMFYIw32tR8VoPZUHpvvHAglQm0iNa+HtqoEIXLv7c0PHbqJUQqt7+/u9
	ys1w7iV97GPVr2MeSFBm7OyX5augZQyvTqB+PwMglBdxRDztHPGfO54iAqW2EgAT
	4sH+YOc+gW4vuPsKT4pORoFltd/k/Yp6hoLd+uveX/a/dReFQpAt7XqMOXFZOrpa
	U2Vu9GZl4Vitgunkw/vx3z07EbRtcflYnchymUwIPSBEKfaSWj0W9vIlswzIBnfD
	3seFVlvfuyPt+ectXZGul85Cd4+IKL/WL2c4iiLNeqIav2kYigAF/EJeWStlh+OY
	Rxl1R3zcT9EUH470ilYLg==
X-ME-Sender: <xms:n4JoZzWjFCJ-UcjF7U-Wa5OQjl6l3pSgawqD47_zWbLPcZRjpRChJA>
    <xme:n4JoZ7k3PcBuFp9s6QgajWnPUKdduJ33iiC9UBvuh78aQSsooRUTv4aW-m4KWiblS
    KIjbl4puSzEHew33A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtkedgudegiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdfthigrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtoh
    grshhtrdgtohhmqeenucggtffrrghtthgvrhhnpeethfffjefggfeuheekjefguefhhfef
    leduvdehgfetueegfeffiefhtdejheeuudenucffohhmrghinhepghhithhhuhgsrdgtoh
    hmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhih
    rghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgtphhtthhopeduvddpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgtphhtthho
    pehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehlgh
    hirhgufihoohgusehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrtghrohhmohhrghgr
    nheshhhothhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdr
    ihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhsuhhngihisehlih
    hsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgii
    pdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:n4JoZ_ZHDZ4llpd1wTBJ_mBsQDuxUmyp8G6NR2PfrZDmTsxR0nZ_vA>
    <xmx:n4JoZ-UT-il-LNasM-S-CLxuOok7hZGZINXFp6e9jhCtiwYSozEy3w>
    <xmx:n4JoZ9n6ubaNIzxv_yvMWsI9SpePzo7i8i95lioDViyn-oGg0hXWPw>
    <xmx:n4JoZ7dggdNQby1s5jNXsQTec3a33b7gZlXgWiMLQOXcR3ORC-ANTg>
    <xmx:oIJoZzcPHWhc4dfF6ysQ2d6rFCFzvPohVdB7AFBSgWRa5qPcvh95N0yY>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7BD18BA006F; Sun, 22 Dec 2024 16:20:31 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 23 Dec 2024 10:20:11 +1300
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Chen-Yu Tsai" <wens@csie.org>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, "Chris Morgan" <macromorgan@hotmail.com>
Message-Id: <982a7d32-ab58-434e-a125-4f7143928caf@app.fastmail.com>
In-Reply-To: 
 <CAGb2v64qf0jNv72uHUK+aSj0Xt-bf+DW0NCnsZmLf-6xHZF_ew@mail.gmail.com>
References: <20241221094122.27325-1-ryan@testtoast.com>
 <20241221094122.27325-3-ryan@testtoast.com>
 <CAGb2v64qf0jNv72uHUK+aSj0Xt-bf+DW0NCnsZmLf-6xHZF_ew@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: sun4i-codec: support hp-det-gpios property
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

Thanks for the review!

On Mon, 23 Dec 2024, at 6:15 AM, Chen-Yu Tsai wrote:
> On Sat, Dec 21, 2024 at 5:41=E2=80=AFPM Ryan Walklin <ryan@testtoast.c=
om> wrote:

>> @@ -1635,10 +1681,11 @@ static const struct snd_soc_component_driver =
sun50i_h616_codec_codec =3D {
>>  };
>>
>>  static const struct snd_kcontrol_new sun50i_h616_card_controls[] =3D=
 {
>> -       SOC_DAPM_PIN_SWITCH("LINEOUT"),
>> +       SOC_DAPM_PIN_SWITCH("Speaker"),
>
> Why?

The speaker amp is controlled by a GPIO, this needs a specific card cont=
rol to toggle on and off, discrete from the line-out volume. Muting the =
output entirely is not what is required, hence the separate control. I a=
lso understand (although it is IMO not well documented on the user-space=
 side) that "Speaker" has a specific meaning to the user-space routing. =
Can add this to the merge message.

>> @@ -1684,7 +1731,7 @@ static struct snd_soc_card *sun50i_h616_codec_c=
reate_card(struct device *dev)
>>
>>         card->dev               =3D dev;
>>         card->owner             =3D THIS_MODULE;
>> -       card->name              =3D "H616 Audio Codec";
>> +       card->name              =3D "h616-audio-codec";
>
> Why?

As mentioned in the cover letter, ALSA UCM in user space uses the card n=
ame to detect and apply the relevant configuration, by loading /usr/shar=
e/alsa/ucm2/conf.d/<driver_name>/<card_name>.conf. Spaces are therefore =
removed in the card name to make this easier to manage. Happy to add thi=
s to the commit message too, and this could be changed to card->long_nam=
e if it is desired to maintain a human-readable card->name.

See https://github.com/alsa-project/alsa-ucm-conf/pull/491/files for the=
 UCM patch.

>> @@ -1940,6 +1987,14 @@ static int sun4i_codec_probe(struct platform_d=
evice *pdev)
>>                 return ret;
>>         }
>>
>> +       scodec->gpio_hp =3D devm_gpiod_get_optional(&pdev->dev, "allw=
inner,hp-det",
>> +                                                 GPIOD_IN);
>
> Just put it on the same line. Lines can go up to 100 characters.

Thanks, will do.

Regards,

Ryan
