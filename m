Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE9717BB16
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Dec 2024 21:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734902629; cv=none; b=D5gLO4/76WaW51G1bUgiOe4coZpP/eaOIHD45HkukZ+oLjGzYHi7dOKNsbqY8nHVtHlP4q3YAEVcRQT1wptGK9BDTapNMy8I7A1EADAilbnLtbjWYOCu0CmEbJPsNtC3eRgWTmJdNuKujrzVqm4ZYSI0jDK+6vWw6rdAn29FPD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734902629; c=relaxed/simple;
	bh=7AcPV7/0ZMfbByZlBOXinUBbEdNe1xNeD6bz2Wkmsho=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=hwcdsK2oWc1t4dUvxIxMFGxhugmN2tvvEqJteMUjZUfDSCWVEqlxgXWpNjleelSkZQy6sfAJHybFK06S3HnqDpp+gOy364F/z7lRdNb8wYW8srhvQD2bKYeTSZZ59dLeleQwX+GGaQjrLcioTFNVurPrzy9Zbw+CZtuoILH5dMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=QhFatHfz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=sIXvwhNc; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="QhFatHfz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="sIXvwhNc"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 69CD21140138;
	Sun, 22 Dec 2024 16:23:47 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-04.internal (MEProxy); Sun, 22 Dec 2024 16:23:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1734902627; x=1734989027; bh=360wG8yLe4tWjbNpiUFYMyVJ9AzyCTGt
	U8xrSTR8xcY=; b=QhFatHfznEgV3fSaqD6hA0gkLh96yk91mWff20gxvUiXPLsn
	x9ycXWKNKbhwn+qcYPIuGcREHaqhtY25dzxaHQWWAyLb+O7meZtRPTh8df/J52CF
	2gjgFJPqME5h2vcRlbUI/Z9lk+4xtjDEZhfccEIZoOI4UIA4fVFkVHKgVlhqSySp
	RrwtNRmd4am2/zla2I7KwsHJ/tQV0F2Itcwdqvrm18P2dkZcPx1DzWfJXc2r/b28
	b5vBCdYtJLaXVvxiAiNanzBlF+LKBv9nnN4o3ElRX5E7BHJQs2lrZXsUVvUt7ACW
	lks77DrYD0cE6dykzTsVZXRi0aLYJL897aH7cA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1734902627; x=
	1734989027; bh=360wG8yLe4tWjbNpiUFYMyVJ9AzyCTGtU8xrSTR8xcY=; b=s
	IXvwhNcgICYheYdYbSAyBmnTZTpHnttkVgaMfR1KDyaF5zztGR9w24B8TpmWbL6g
	CNiPIlG5lduA7+NpOZ+CanruWSrVagi5KGPJrOlXQnb/oi6J4GQh46kIQIyrJPLY
	bkNUBYpSaZTI0tJapG5RCkcI0PrK7wYGXQvkFZjroY+TV+tfzMNJ9ddci1cYptD1
	9N0wzggEYN3T4xBn74pwyjoSCVHP2SltWl/WdfK8VTPOi4gHL95qnDdq1Aca/m/t
	GOcdr8O0rJRDP8kvMGGVaDds/02g07naTUKxMbW7Rstnm1jJ1O4EdeFB5Cn2YhAA
	fTE8ITmqGN5WwfZJm/1Iw==
X-ME-Sender: <xms:YoNoZ3b7BPxOcomS74ZvhUL-xSi_t-0VLcq3CmVY__AQR5XSA-vEpA>
    <xme:YoNoZ2YxyTTQzmG5m3NwAcQmo-yW2g7m7Y2tCS5Ve8p_oJxcw2kL807bp409ACum3
    dP_WXEIy4yaKCwV3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtkedgudegjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdfthigrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtoh
    grshhtrdgtohhmqeenucggtffrrghtthgvrhhnpeejhfeukeejjefguddvffehveevjefh
    tddutdfhudduvdevfeejfffgvdelfeeugfenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgs
    pghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeifvghnsh
    estghsihgvrdhorhhgpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdprh
    gtphhtthhopehmrggtrhhorghlphhhrgekvdesghhmrghilhdrtghomhdprhgtphhtthho
    pehmrggtrhhomhhorhhgrghnsehhohhtmhgrihhlrdgtohhmpdhrtghpthhtohepsghroh
    honhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgv
    rhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinh
    hugidqshhunhigiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehpvghr
    vgigsehpvghrvgigrdgtii
X-ME-Proxy: <xmx:YoNoZ58EdDFXg4bdLiJU-GuGUGcv4J0sXDqj9DC1lqL6MR7VQIEebg>
    <xmx:YoNoZ9o9BLRdYNDHKOMPKGx-TO4kP-igDVtXOEBMGnGaA8QUEOrKAQ>
    <xmx:YoNoZyr2m8L6N8JSUVB0LkCOPaEPiTxr2wAbparg7TxLYSOtB6ZTHw>
    <xmx:YoNoZzQoMNeCouX9hYVoEwHTmjgGnHyJ8cB9Zf-yh-3QBWr-TgZW9A>
    <xmx:Y4NoZ4imCsQYY7E9Oza0H3wcr4XbmCHibE2_MsY5VGC6nd9wLcAr4Oa3>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C6449BA006F; Sun, 22 Dec 2024 16:23:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 23 Dec 2024 10:23:25 +1300
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Chen-Yu Tsai" <wens@csie.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, "Chris Morgan" <macromorgan@hotmail.com>
Message-Id: <c64563ac-ef6e-4d87-a634-9a5edde86a53@app.fastmail.com>
In-Reply-To: <6768438d.4a0a0220.399c57.89b6@mx.google.com>
References: <20241221094122.27325-1-ryan@testtoast.com>
 <20241221094122.27325-2-ryan@testtoast.com>
 <6768438d.4a0a0220.399c57.89b6@mx.google.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: sun4i-a10-codec: add hp-det-gpios
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 23 Dec 2024, at 5:51 AM, Chris Morgan wrote:
> On Sat, Dec 21, 2024 at 10:26:32PM +1300, Ryan Walklin wrote:
>>  
>> +  allwinner,hp-det-gpios:
>> +    maxItems: 1
>> +    description: GPIO for headphone/line-out detection
>> +
>
> If possible, I wonder if we can keep this without the vendor prefix?
> It looks like for now Nvidia and some Rockchip codecs have the vendor
> prefix, but audio-graph bindings and Freescale codec bindings have this
> as a non-specific property (and it looks like simple-audio-card does it
> either as "hp-det-gpios" or "simple-audio-card,hp-det-gpios" depending
> upon the circumstances).

I'm relaxed about either approach, it does work with the vendor prefix but agree just "hp-det-gpios" is probably appropriate given the intent is the same across vendors and devices.

> Also, the behavior of this is very specific to just the Headphone sink,
> so we should drop the line-out text from the description. If someone
> sets the routing as `"Headphone", "LINEOUT"` the state of the GPIO will
> affect the audio path, but `"Line Out", "LINEOUT"` will not be impacted
> by the state of the GPIO.

Agreed for this device, but this is a more generic description for the H616 generally, so I'm not sure we should remove the "Line Out" given that it may make sense for other H616 boards (Orange Pi etc) where someone may be using a 3.5mm jack as a line-level output rather than via an amp to headphones.

>
> Thank you,
> Chris
>
Regards,

Ryan
