Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490EA5103F
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Apr 2025 09:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744535025; cv=none; b=Qj9AbAIN4QT+6jWdbEMn2pOcCB2h7kGNZ6tD1vD7n8oFnksAzHKcu96JDwhRpifZ7ZPVnatFFk6GWzmfSC3NjdGRsdh/tFYdWP0rAcaVf/q1ZgtQwgUtuJSPkuCWbfoa+ylcwOGhNUOGIRLd0+ZfnR+2lx87K9qwcklm7yqgEag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744535025; c=relaxed/simple;
	bh=u4O0zrvtwd/x3r42Bw/EXFSAj3M0NwFIEeiBXDQFw+k=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=s4ROkU+daftxnz+iDk4d2K9yBnnLepAdnBDdTmaK1DkRNCdyB18/CQ2/F+aQCh5Bv84yGsLZcyvFLl8NI7dezFlgmwLH/4FVo12tJmqr32vnZLzB9Za2/mx7245B+JifaHC8R1LBvY0jN3Ix+cl98JwvvIBG6VcHen6PEf4IN/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=0gSfNSwQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=p1A1JDB4; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="0gSfNSwQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="p1A1JDB4"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DC85F254024B;
	Sun, 13 Apr 2025 05:03:41 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-06.internal (MEProxy); Sun, 13 Apr 2025 05:03:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1744535021; x=1744621421; bh=u4O0zrvtwd/x3r42Bw/EXFSAj3M0NwFI
	EeiBXDQFw+k=; b=0gSfNSwQ4PuK/lwE+6TlHRgtEvjx9P3CN9lPollOBcbq+3m6
	C4xNMtCPfIyTh+oKsKjmy/HgvWJ4AnOnII61FcGCjOFtf9oiv41tPlNgcNz/bYDL
	MfQSnGR1hk9WkT/cAnce+ElnlgbHK8KkuLz724Rgbagrt021xKAZsgHU3I0noa3n
	jRWhhmK9s4vhbdhw1d9fx7jATfPucQfGr1KFG+ycBaaDUvhzhn2adeHU/ml9NuN4
	VQ8Viu8ZPze91H9vH9jQglWvRs2qJ+EryAAAYp3csXBN4tRP9R5Ow4xUfBTBZ/7z
	sP22RWhzIZG0ZoCRO0VRScAfFOVXKbY6a+nn4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744535021; x=
	1744621421; bh=u4O0zrvtwd/x3r42Bw/EXFSAj3M0NwFIEeiBXDQFw+k=; b=p
	1A1JDB4jwAW4aIfbVFSHjacgRv08fkoUHNzjq3CUBcj/vGuJyVS3CA1ke6MRYhnv
	BC1YE5IcCIc/4G0NlwkpRzUaeOBVeQGMlvASnKDQItplV8qK5PfYi006V8TwaQJW
	wVpL5OTFh+uFVPi/Hk4zD/ulvoRoX8w4Tm71F/HUxmq04E1JvqmZw4gUZ6Y3dV0s
	4wM6wVTuubovppEVcsgXsvjGjunvUhPG9PLibOADs/74vXYRYE7hV3OR6FfMfxds
	Om63u3zcUTOFqJ4nrPEKiqd6Ojz4sXS4512NGq2J6/MFTVAgk+NUa6bBgW5Vy5wn
	ICvyQIWph05I/bAdsxUiA==
X-ME-Sender: <xms:7H37ZwHcvNHThsBihjyDR2PSh_Rv6vJBh8PvyTrqD5lAzj91WI0HGg>
    <xme:7H37Z5Wu9PFjvf_I6BIg5PfjqHZOpAwnr-VB9INfa3B1yU_JXVp6wItPF_QKuN2TW
    tFZfdJtw5L8-WfQEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudejvdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftfihrghnucghrghlkhhlihhnfdcuoehrhigrnhesthgvshhtth
    horghsthdrtghomheqnecuggftrfgrthhtvghrnhepgeekuddvvdeggfejuddtjeegjeff
    tdevudffudegudethfekjeelgeeitdelgedunecuffhomhgrihhnpehkvghrnhgvlhdroh
    hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehr
    higrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghpthhtohepudegpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghpthht
    ohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplh
    hgihhrugifohhougesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnshdrphhh
    ihhlihhpphgvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrtghrohhmohhrghgrnh
    eshhhothhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    hinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
    pdhrtghpthhtoheplhhinhhugidqshhunhigiheslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:7H37Z6KLxPhFZNVRGL_UmKOr3KWsc5MXiASIPmWmw6l7Pz0uJy_PMg>
    <xmx:7H37ZyFsXvt4Sqg3zm5wPsd-4m_FNXAYglxhb2EenIB52-ACujp_Ag>
    <xmx:7H37Z2V0CWW5idddSXcTaPraaW6FaJVSpFmCVZJGXS6Ug5nsSeGYZA>
    <xmx:7H37Z1Ppm-en6G5ygiwPB-AGVUmP-XIhB9k-b9dKtV2uyd8evI6kyg>
    <xmx:7X37Z-7hUsJdyKqR0skR9rWrs588Knh9WTpIYuI59_vF2Ss2rOaLbcNR>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 25653BA0070; Sun, 13 Apr 2025 05:03:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Tde5ab3e282bf40d5
Date: Sun, 13 Apr 2025 21:03:18 +1200
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Chen-Yu Tsai" <wens@csie.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 "Chris Morgan" <macromorgan@hotmail.com>, "Rob Herring" <robh@kernel.org>,
 "Philippe Simons" <simons.philippe@gmail.com>
Message-Id: <3234bd5d-c2c9-41f6-abda-b1aaad42f31e@app.fastmail.com>
In-Reply-To: <20250214220247.10810-5-ryan@testtoast.com>
References: <20250214220247.10810-1-ryan@testtoast.com>
 <20250214220247.10810-5-ryan@testtoast.com>
Subject: Re: [PATCH v3 4/5] arm64: dts: allwinner: h700: Add hp-det-gpios for Anbernic
 RG35XX
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 15 Feb 2025, at 11:02 AM, Ryan Walklin wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
>
> Add support for headphone insertion detection via GPIO for the
> RG35XX series, and add the corresponding routing to the codec node.
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Tested-by: Philippe Simons <simons.philippe@gmail.com>
>

Hi all, this DT patch did not get picked up for 6.15, however the rest of this set have been merged as part of the 6.15 sound tree [1]. Would appreciate if this could be picked up.

Regards,

Ryan

1. https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e50da555ca4d42b1b98d0f26789db64f26a0919a
