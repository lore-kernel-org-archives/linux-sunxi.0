Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883E4198822
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Feb 2025 20:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739566401; cv=none; b=QhDXKb6TL29m2xM6oe00Pkz9zJU5ayPpi5+ulrfPvWl7gYIuCeHXuRnkXy3nhouneE2MomB7QIW41UQx7Kbht0glHR481i+vp84e0G8bvaMDv8cVV2YrkAJ/ZEIA3rECz5DnsQ5Gf36rTFxHl+YA6xd1w31B9IVzzVH11fT+2Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739566401; c=relaxed/simple;
	bh=tP6TWlVS+e0yQlRVKaAnhFvXz2tLpWX0gcV22HBOliI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=oPWZ+kzPpXnDm2ReErrdTsCXF1Vll3IT1VMDXuniodo07seDnMDbbHVl3jcMQ2VINH+uFDHbJBrRbK019hpA1JibWq/6f9UNfIZYEFHK5fXzRFujNm/pbYf0GRUI4b9uWFiJl0yxHnC5g9S23g6zMmHkFEwKMWbPvTv8rmd3hGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=aZ+0EMix; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GXPFvkIk; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="aZ+0EMix";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GXPFvkIk"
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 55A61254014C;
	Fri, 14 Feb 2025 15:53:18 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-13.internal (MEProxy); Fri, 14 Feb 2025 15:53:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1739566398; x=1739652798; bh=tP6TWlVS+e0yQlRVKaAnhFvXz2tLpWX0
	gcV22HBOliI=; b=aZ+0EMixCqpdZdtygFkX0S5NBGsyyFNEF1OxH9wmAFRpd2+x
	H9T4kgIRp9ety5bmXx//awaI9Ye9mGByE9z/W/CXrv7yN7S/0Dde8kTXxWyv8COn
	bnJ+HKayeQE7RH4wWbrGJIucGG0J4Oq4gB3aSeT2IR6ULXzwgXqKSCoWbW/AZMAJ
	DX96QnxIsfncLsMNH5eAsbEUVlznClWXPhzWxf6I0ygxNfrlmEUYCAedlxGomq3F
	XAJ/jGiII5OIsTeJ5ieASE3Kpk1sir7JXNawqPGAvolpzBWTwebaBoi0gZKINY05
	SR7FR6wSLfbrocr30QRIEFs63+To+8mm1qvi6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739566398; x=
	1739652798; bh=tP6TWlVS+e0yQlRVKaAnhFvXz2tLpWX0gcV22HBOliI=; b=G
	XPFvkIkafwq9pfnR1aA9L4tSKLp1IV1xwHw549epdoSVWTf0rAvstBgMP0L+agMN
	0IQ1s2WgWW5yFUB1iHtR5rZKa9qNTtGcG2S1rIPqdAezjNWDEM2b2Nf+gZIvSeHe
	mJkCq1ztbMeIsKPRwyJxvK75z2GocIQHfsJ2ZEz99AJNeT9n6taQsWqSmYmnpLwa
	amDBXC7v0oUXo9kdVgLMj6qM5K3axW1AggxZpW6cUuk9hTW9pUUy4nwTBt17xzEc
	SM/2ZsdEY3mI98Srl+1WljR4Y/gQxsz5qnF0QwECHOU3mZ3Oy0spG78LazsI8XD2
	pft4zcnJH8olmF3ByK+NA==
X-ME-Sender: <xms:PK2vZ1bQHRyyNXmXjHOCrirIltApDcwXx88Zb0ZuP7t3ShBPY5KnIg>
    <xme:PK2vZ8YUHa3l_F73hejLAXDx9iBL1sj_BsM4pSQAUpiJx3Pp6tSthgw6VUaa9FxEL
    oEi2t5e-vd-mf-EBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehtdeiiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdfthigrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtoh
    grshhtrdgtohhmqeenucggtffrrghtthgvrhhnpeehteeiveetgfefieevffffkedutdeu
    heekffefudehhfevfefgfefgudfftdeivdenucffohhmrghinhepghhithhhuhgsrdgtoh
    hmpdhrvggrughmvgdrmhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgtphhtth
    hopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepfigvnhhssegtshhivgdr
    ohhrghdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomh
    dprhgtphhtthhopehlghhirhgufihoohgusehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    mhgrtghrohhmohhrghgrnheshhhothhmrghilhdrtghomhdprhgtphhtthhopehufihuse
    hitggvnhhofiihrdhmvgdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfh
    hrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhsuhhngihisehlihhsthhs
    rdhlihhnuhigrdguvghvpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgii
X-ME-Proxy: <xmx:PK2vZ38U9KeVGeKZmCiWaVZdvWu6fuTEpUlIui-zIuOuvu1gmASOTQ>
    <xmx:PK2vZzpAThlzlUvs7dDdOKTVmI5svS39XRisK8Esknm2O29V7VWSBQ>
    <xmx:PK2vZwo5wdHzOyJ_rhjnG31fSnwiDoFsBPEhrRhIlkNihB68LTSVvA>
    <xmx:PK2vZ5ThoqrVwpb9sHHHCTm2kme6fpvSagvPU6k_6PKNRllPnfZn4Q>
    <xmx:Pq2vZ2gMF1BrKYKM1fpJx6-M3lyUPEhYYgXcX35NXIt8jNVrzXpHLIZk>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 985B9BA006F; Fri, 14 Feb 2025 15:53:16 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Sat, 15 Feb 2025 09:52:55 +1300
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Icenowy Zheng" <uwu@icenowy.me>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>, "Chen-Yu Tsai" <wens@csie.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 "Chris Morgan" <macromorgan@hotmail.com>
Message-Id: <e1e08020-8284-47da-9cf1-fd7fd1461e74@app.fastmail.com>
In-Reply-To: <c5ade280-d607-4870-a4e0-7d455f6bc6c3@app.fastmail.com>
References: <20250125070458.13822-1-ryan@testtoast.com>
 <20250125070458.13822-6-ryan@testtoast.com>
 <db43243ea653073d223e640f064cd480da7e2cf5.camel@icenowy.me>
 <c5ade280-d607-4870-a4e0-7d455f6bc6c3@app.fastmail.com>
Subject: Re: [PATCH v2 5/5] ASoC: sun4i-codec: change h616 card name
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Tue, 28 Jan 2025, at 2:10 PM, Ryan Walklin wrote:
> On Sun, 26 Jan 2025, at 8:51 PM, Icenowy Zheng wrote:
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0card->name=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D=
 "H616 Audio Codec";
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0card->name=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D=
 "h616-audio-codec";
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0card->long_name=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D "H616 Audio Codec";
>>
>> I think it's part of the userspace API that should be kept stable.
>
> I don't have a strong feeling about this change, but can anyone sugges=
t=20
> any other options for how to manage this name being picked up by UCM a=
s=20
> a file path? I guess the UCM paths can include spaces, but this is=20
> slightly unwieldy and may break if proper escaping is not done.

Apologies I have misinterpreted what the user-space code expects, it see=
ms (as per https://github.com/alsa-project/alsa-ucm-conf/blob/master/ucm=
2/README.md) that the UCM file path is derived from long_name, not name,=
 and name is only used as a fallback if long_name is not provided. Will =
send a v3 just adding a long_name instead.

Regards,

Ryan
