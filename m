Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EE318C0C
	for <linux-sunxi@lists.linux.dev>; Sat, 22 Feb 2025 05:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740201071; cv=none; b=HoiPg0lVfMOIWI+bYZc4/h3QZKiHVpQb4NvPtTcQpHoVSVePXK2vo3ZM0s+u/g2Lpl6FdPgE8n/W52QkJYiNoklM0odhkMg1olxkns5G8MBppYYh7IXTrziI/L2tyOTWQW3sTsnai2FPI0RhFGegPYlKjTQIo/zFV6A0AN8MemA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740201071; c=relaxed/simple;
	bh=FS7Y1dSUAKOMwo2kWuMHZBI3QV+UsaPs9EvNMIb4aio=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=j2bCGJDClBo4+5KJPYw0p89+2KDOrFbI5jhUUnIOGJGYwvGDHsdPfbMFaY/igC/qg8jOdCdeQp5ZTmKKBgOyp9MDI0GnHIYVQRA4ejsU0unpxNZpfHqI9jF2zPJ6YXEZ/f0p5ZUpUMMVMrjdnLykHA9EnB8+RrMfOkYjbdJcakU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=NYhwOKJh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=4nfDT4Xu; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="NYhwOKJh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="4nfDT4Xu"
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1224D11400A6;
	Sat, 22 Feb 2025 00:11:08 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-13.internal (MEProxy); Sat, 22 Feb 2025 00:11:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1740201068; x=1740287468; bh=ftugCOFOnAKLUgdSUiW218ZfB28SAFls
	af4JlXUchKw=; b=NYhwOKJh5ACBXljf5FhqyZahOUbRc3MKjwkg1Z2xOS/RB39K
	xN2MFxJE5FXzzm0bcQtBdrNOoMaK0HSLKwgFXM8ooNnoSxCCI6izIakpBRZbaTQZ
	LmavxIL/DM3KJ3gS7TDnvJQQ6i0Tuxa3tuFw52y2xkJOOft4dwcBkoBQ0jn24u9c
	2yjO4XCOW6CyYrb+pMQ2LKMA3/AqXgPWuBxdCs8SdRnLZbj0M76dkAyhVv+Pt8VE
	ai73m7aLNk0goINuHdJKHgTWCLlNNe/2sgWQo7be/qKSaGcK/g2f1FgUumBFD/TR
	496oXSPhGnxIvtUSw4RsfWFAvWsvORe1wZ+ucg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740201068; x=
	1740287468; bh=ftugCOFOnAKLUgdSUiW218ZfB28SAFlsaf4JlXUchKw=; b=4
	nfDT4XuDP0bxRlehwe7RViGr5xCIGPaWP2qL5alDa5yU4s/AgL0tY0t56doYl03a
	ftsBYlWLgZGzMNGJX5uB/Ua9bxcjOS2vF/01RJn7/DsBqoWL+wbyx+rmFo0z/7jX
	sepi7OHzQVtKl//rTmvcTr4X4m7bGRK4hWY2X+g0PKeQ6jxSL8sY/nkR4EqYBU2f
	9v7FuBibliWjp7wbdx+UraE5y6PYdy0V5IuSxLM58kom67ZfognzIrsbcwoKG1/k
	WG7g+0xssvQNM/K72+OQxL4YsZK8dWCYNGYZD7K1XRB3tt3oUvW8x50NGaZuKA6w
	Q+XJcQn8nFTx1gSInysgg==
X-ME-Sender: <xms:aly5ZxnYk5l9lx9C0lpDA5d-XRgyHKque53KFyOQsqTUdsCAtgtbJg>
    <xme:aly5Z82UG2WnUu9ERzmudia1Vkxfzrso-LWiP6eTPPojB-XtmYIzqcQ6FAd5yRqBv
    BMEsJ3CyEzPRbTUIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejvddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdfthigrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtoh
    grshhtrdgtohhmqeenucggtffrrghtthgvrhhnpeeghffgkedtueeiudeukedvveevhfdu
    uefhhedviefgffduheeuieeihefhfefgveenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgs
    pghrtghpthhtohepudegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeifvghnsh
    estghsihgvrdhorhhgpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdprh
    gtphhtthhopehsihhmohhnshdrphhhihhlihhpphgvsehgmhgrihhlrdgtohhmpdhrtghp
    thhtohepmhgrtghrohhmohhrghgrnheshhhothhmrghilhdrtghomhdprhgtphhtthhope
    gsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsth
    hsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqshhunhigihes
    lhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:aly5Z3rhyr4Bpjp9i5j_uoiahH66QS_3uUzzB1I9EN_moKDKAw6wuw>
    <xmx:a1y5ZxkJUXCs0m1EwBznwQE5_eV3iKY69tXP2dqVhnq4EKdzmbuhhw>
    <xmx:a1y5Z_0Z_e1kUcujNYF-jE-ugKjkIbDRZtl_TqpvOo7xEP4qGL5kVQ>
    <xmx:a1y5Zwv7P5ZTRUVvLL14R7zuNfcRY2VE8awUaUbXCuUd3pUPhqbKoQ>
    <xmx:bFy5Z23dxiFwFde2KEo5_GAhHDnin3frHZUnTUBWcc9Lc7NFwkfLo42_>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D2BDCBA006F; Sat, 22 Feb 2025 00:11:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Sat, 22 Feb 2025 18:10:46 +1300
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Chen-Yu Tsai" <wens@csie.org>, "Samuel Holland" <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 "Chris Morgan" <macromorgan@hotmail.com>, "Rob Herring" <robh@kernel.org>,
 "Philippe Simons" <simons.philippe@gmail.com>
Message-Id: <69bce5eb-c478-4b9f-a875-1e2a8a540898@app.fastmail.com>
In-Reply-To: <2733255.KRxA6XjA2N@jernej-laptop>
References: <20250214220247.10810-1-ryan@testtoast.com>
 <20250214220247.10810-3-ryan@testtoast.com>
 <2733255.KRxA6XjA2N@jernej-laptop>
Subject: Re: [PATCH v3 2/5] ASoC: sun4i-codec: correct dapm widgets and controls for
 h616
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, 21 Feb 2025, at 8:05 AM, Jernej =C5=A0krabec wrote:
> Dne petek, 14. februar 2025 ob 23:02:24 Srednjeevropski standardni =C4=
=8Das=20
> je Ryan Walklin napisal(a):

>>  static const struct snd_kcontrol_new sun50i_h616_card_controls[] =3D=
 {
>> -	SOC_DAPM_PIN_SWITCH("LINEOUT"),
>> +	SOC_DAPM_PIN_SWITCH("Speaker"),

> Will this break sun50i-h616-x96-mate and sun50i-h616-orangepi-zero bas=
ed boards?
> If so, other solution must be found.

My understanding is that this a separate concept from the codec power co=
ntrol itself, which is already covered by the analog and digital power s=
upply DAPM widgets. For the H616's single lineout output, it doesn't mak=
e sense to have a separate control for this, as the codec should power o=
ff when idle using the existing DAPM widgets, and the lineout route is a=
lways active when the codec is on. The LINEOUT control here is redundant=
, and not connected to any userspace mechanism in the current state.=20

However for the RG35XX, which has a speaker amp controlled externally, w=
ith audio routed via a passive mux, it make sense to specify this as a s=
eparate route in userspace with a corresponding control (via GPIO pin in=
 this case).

The other H616 devices (Orange Pi etc) only have a single route defined =
in their DTS, and no internal speaker to require a speaker switch. This =
control does not do anything for them, and removing it should not have a=
n impact. I do not have this hardware to test, but on the RG35XX devices=
 audio is produced without it being present, and with the speaker switch=
 in either state (headphones plugged in and speaker amp off, or speaker =
amp on and headphones connected).

I did try to convey in the commit message but happy to correct the comme=
nt if you feel it is not clear.

Regards,

Ryan
