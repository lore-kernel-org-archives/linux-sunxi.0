Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296391F76C7
	for <linux-sunxi@lists.linux.dev>; Tue,  7 Jan 2025 21:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736285613; cv=none; b=lM/MfKXh3Hzi1xNMHi2tgJRCtxnP7z8rCHRmWwcAzhvzH+sZvGmQc8oYW3gSXWhPF1ltRdsOR2UVl6UV2MgEHEW9SxKObYMk0BXMwRQez2E5+9mr5AvxAgmlUvCJghnK2j7hvNr+e4jPtlBV50Xj4xVwdOmmpI7RNzsrMB/NnfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736285613; c=relaxed/simple;
	bh=lVcbgRIjckxRhNznYZDIwzjfYyq6KPmJCVPdHnYeeuk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=hMRt34ZQQnsv56/tOBnS3TWk6vzDU3tBBn4SNURUIgY6iYPYkmQUkPd6GTfpSeXHZDE6VbrqrcULDId/4xvwieWS3M02mFA19+umFAsJMjAN3OF4tp38UdtupdntoGAtrkx5fsnroiXAHcbRoyutj93pcL+jkXBbjXmmnDFNO4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=Exzc//Ap; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=f0pcpNIJ; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="Exzc//Ap";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="f0pcpNIJ"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 21A7C1380231;
	Tue,  7 Jan 2025 16:33:30 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-04.internal (MEProxy); Tue, 07 Jan 2025 16:33:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1736285610; x=1736372010; bh=g6ya314sxovkhWFQqUN3Lszhjpeui25J
	0XtZ38dBwj0=; b=Exzc//ApsdyM4zlHLFXoh4XrYrxEJsK9gtyJXwbIGDHwO8EJ
	yNhJ4qHXXxFfEXyET+Ydvi+/9b5ONKzA+nRhIN9QzYCLOhxmx8+NLgTO0smmtLz+
	iQ3H+Dj6HmYxg55kXdPSaYo0H1wzClx6yWUHAgRbgMAk0Fw90gve1K3sGdMQP1Ai
	eLJ7wNmILgjLG8yMs9FwYGq3/yekurcgOPPw6xp7gSAnujhdmmTVmiWKv9ruXj3e
	+t0JfUj2I911MQO9W/eYjv9ZDh7luJDd4Lf6mKy9qO/3XSOk/qcYx6BWnJmn39mt
	KbnLBGmP09nNGXc0xvJgoapY9Hu8nHguWS9/GA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736285610; x=
	1736372010; bh=g6ya314sxovkhWFQqUN3Lszhjpeui25J0XtZ38dBwj0=; b=f
	0pcpNIJuZA5XkE8jOoelmg48wq/4fAlKDwAaxq91KX2RzdEnrhCglsOnBKz/oQNj
	QU6li75sqXqbcyG+Y1tjt3+iL+i38WMRWdTGjUGT1HwvI59W/PkNT28XK9eX6P21
	ERs+S+gQQYDKyfFykwhNllkk+AJLwTaFvpe/eyV7J8iKxoyHFQGBkCUMqyNtoN+m
	8h0/tqbkc8j4+EGKnNN7HTBPe1ChvjE9CNnjyMvCMec5PuHxheeGoqjGAXfMYsYC
	Bxwn3YcG5v5I7ZJmnl0Ojw7m1+2LUB4sz6UV06Wi4b4RhxnEtaxFdLTux9ldpYQq
	lhmkMN1IsQ/683PFnvOUQ==
X-ME-Sender: <xms:qJ19Z4hNC8ujXE3Fkrj6P19E5d1Ykp4AtCRHK-Wx7Z-pxXXGxPWXiA>
    <xme:qJ19ZxBPzkwLufaC0evox0xv0gk2M7gQ17VRjqGCtwDm-r96-0-8FvGqekKSI-Agm
    ZEYCN6Mnv1CxLz5Fw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegvddgudehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdfthigrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtoh
    grshhtrdgtohhmqeenucggtffrrghtthgvrhhnpeeghffgkedtueeiudeukedvveevhfdu
    uefhhedviefgffduheeuieeihefhfefgveenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgs
    pghrtghpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeifvghnsh
    estghsihgvrdhorhhgpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdprh
    gtphhtthhopehmrggtrhhomhhorhhgrghnsehhohhtmhgrihhlrdgtohhmpdhrtghpthht
    ohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrg
    hrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthht
    oheplhhinhhugidqshhunhigiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtth
    hopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehsrghmuhgvlhesshhhohhl
    lhgrnhgurdhorhhg
X-ME-Proxy: <xmx:qZ19ZwFiAMkkNG82OEvAfw3ngKKVsjEk6bxbReGfWef4uubn7hoahw>
    <xmx:qZ19Z5QMBmmvGJR9zAMEUZHe3g0V34cfmNcI_WXp5H1Zep_vf-4vWQ>
    <xmx:qZ19Z1wXlFNVdLGcjIuPS62K_6zS7FlYibGKUrNAZd8yfHqq_UmwvA>
    <xmx:qZ19Z342wXR-85w0iXqK54eLT4lR5-T6d72G0yu3wl9aLQvHgUm1EA>
    <xmx:qp19Z77kKVdhitixBBCPtzkd33VN6IPu1oKwIZqCFnVPM-6cN4Ir2KX0>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E2681BA0072; Tue,  7 Jan 2025 16:33:28 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 08 Jan 2025 10:33:08 +1300
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Chen-Yu Tsai" <wens@csie.org>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, "Chris Morgan" <macromorgan@hotmail.com>
Message-Id: <ddf34135-13b0-4a1a-801e-c2c454196ee3@app.fastmail.com>
In-Reply-To: 
 <CAGb2v661eZPh8+ScJNUTXwm_y_RtrL7yo7EE4i_zg-=LrBhBhg@mail.gmail.com>
References: <20241221094122.27325-1-ryan@testtoast.com>
 <20241221094122.27325-3-ryan@testtoast.com>
 <CAGb2v64qf0jNv72uHUK+aSj0Xt-bf+DW0NCnsZmLf-6xHZF_ew@mail.gmail.com>
 <982a7d32-ab58-434e-a125-4f7143928caf@app.fastmail.com>
 <CAGb2v661eZPh8+ScJNUTXwm_y_RtrL7yo7EE4i_zg-=LrBhBhg@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: sun4i-codec: support hp-det-gpios property
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, 1 Jan 2025, at 9:56 PM, Chen-Yu Tsai wrote:
> On Mon, Dec 23, 2024 at 5:20=E2=80=AFAM Ryan Walklin <ryan@testtoast.c=
om> wrote:

>> >> @@ -1635,10 +1681,11 @@ static const struct snd_soc_component_driv=
er sun50i_h616_codec_codec =3D {
>> >>  };
>> >>
>> >>  static const struct snd_kcontrol_new sun50i_h616_card_controls[] =
=3D {
>> >> -       SOC_DAPM_PIN_SWITCH("LINEOUT"),
>> >> +       SOC_DAPM_PIN_SWITCH("Speaker"),
>> >
>> > Why?
>>
>> The speaker amp is controlled by a GPIO, this needs a specific card c=
ontrol to toggle on and off, discrete from the line-out volume. Muting t=
he output entirely is not what is required, hence the separate control. =
I also understand (although it is IMO not well documented on the user-sp=
ace side) that "Speaker" has a specific meaning to the user-space routin=
g. Can add this to the merge message.
>
> It should be documented, and probably a separate patch. This patch is
> for the headphone. Also, "Speaker" is a DAPM widget name and that widg=
et
> is what toggles the GPIO. So it's actually the kernel side routing.

Thanks, happy to add a separate patch, but think it is appropriate inclu=
ded in this series as it only makes sense to power off the amplifier if =
there is no sound output or if we plug in headphones.

> And also, you can't remove the "LINEOUT" pin because it is referenced =
from
> existing device trees.

I am not entirely sure and not an expert here, but I think the LINEOUT r=
eference in the existing trees is for the output route, not a DAPM switc=
h? This was added to the prior H616 enablement patch largely because it =
was in the vendor code, but given the H616 only has a single audio route=
 also called "LINEOUT in the manual) this is somewhat redundant, as the =
analog and digital parts of the codec already have DAPM widgets, and my =
understanding was that ALSA would then correctly enable and disable comp=
onents based on the routing, not that the routing had to refer to specif=
ic DAPM controls/widgets.

>> >> @@ -1684,7 +1731,7 @@ static struct snd_soc_card *sun50i_h616_code=
c_create_card(struct device *dev)
>> >>
>> >>         card->dev               =3D dev;
>> >>         card->owner             =3D THIS_MODULE;
>> >> -       card->name              =3D "H616 Audio Codec";
>> >> +       card->name              =3D "h616-audio-codec";
>> >
>> > Why?
>>
>> As mentioned in the cover letter, ALSA UCM in user space uses the car=
d name to detect and apply the relevant configuration, by loading /usr/s=
hare/alsa/ucm2/conf.d/<driver_name>/<card_name>.conf. Spaces are therefo=
re removed in the card name to make this easier to manage. Happy to add =
this to the commit message too, and this could be changed to card->long_=
name if it is desired to maintain a human-readable card->name.
>
> This should also be a separate patch. And yes please add `long_name` to
> keep the human friendly name.

Thanks, will do.

Regards,

Ryan
