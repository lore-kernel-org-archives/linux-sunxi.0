Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44EC38DE0
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Jan 2025 01:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738026660; cv=none; b=YODxdTn8N4ymBsnzvfA8RjAv0aeiw7KA6ocyACqeKIYrbarvQdnTQ1MjdLha+aWBe4u3/Q59YvAbSWUZ9XYE6upeAhtWFzoBeOcquTmGq0nEEpTMqRFYvHrTz6PdWcxmI+18HaGk/GlYzH1VMrvZfF2FjE0jqzTlCar1wjjqIZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738026660; c=relaxed/simple;
	bh=9Y9ifQAs4cn2c4vccyu4WadO175dQTf2XIDg7UBRWFU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=f17UjpRhEpQivwzF2g0WWwqi1B1pY7lQbSqg6QCQEm5FWRFBXAEiWWGB5tEU4jbfz6jGR3ybxM/tno+laoFJ4KJrkQIT9XBJsjPN0vdwtTM7+kMSP8ItFyoxfVaKvjeoxhdcnQxvsSTcLF2Z49ncujJf03vPBy51WbVKuewyYlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=LZMeVwsD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=g8ZxxBnN; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="LZMeVwsD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="g8ZxxBnN"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E3453114028A;
	Mon, 27 Jan 2025 20:10:57 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-04.internal (MEProxy); Mon, 27 Jan 2025 20:10:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1738026657; x=1738113057; bh=9Y9ifQAs4cn2c4vccyu4WadO175dQTf2
	XIDg7UBRWFU=; b=LZMeVwsDOHbrE65ahjKW0YsDxmBd348k10Xl+scqK8MoKcJ/
	AvWgS/wmsqGbQn8oGdvrWVS9O76tyeA1Dx4SI5Wm+IJhM0zcSJ6gL4Yx1pcor8G5
	KDgA8iw0iaM66X2GqRByV2uDp9OVR5YoRsjv8LwxP+jb8Fal18atc5BG1McY51lE
	M3kobTsQe96+LBLcWZYcNBNyXCNFNwVzJOgmeYlA6h6dTNACBaEyUw5XF38V7QBp
	61tnLP1Sc8h8InuyjPSJfwHpOL8/VSCK2yaIDn/Qg2wWAMZPqt7IckZvnkfFgWN/
	fBXJscyK7xwqT6omXW/bkG7uuYmM7mDWPxAu3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738026657; x=
	1738113057; bh=9Y9ifQAs4cn2c4vccyu4WadO175dQTf2XIDg7UBRWFU=; b=g
	8ZxxBnNB6r0QBtTmNNSZsmGpKKWb8PNcZRJlJ4TD8RM4PG+bA0XUfeMo6SfIXwmY
	cWL4/q6GFz+3rW8ubDX696Tg4Pzx0Q58ox27FeQhQDbhDzNymNJmA7sawesoABCv
	T1oBtWRrMZuHm44spmFJxonBMzPpbjmFoazZmZChIvspPVYLu2wULh6f6U+Ftt1F
	DO4saFODU1DxL9b4T0d0H3V8yUNPuQ1S1fox1Fiu3ZO9ZUL/0fzuvzTEWzeFCwlw
	WiVaRT7TQGQwnm3ubae/9jfo1c/BrUW8JBtmtRvrG91YVe7jtwKPeeJ5RfMGLg46
	omEg99MxaLeEkifmIk6yA==
X-ME-Sender: <xms:oC6YZ7tDBT4d9rAs3oJQ9Bkks_80SIiF9Y2Z2z0wy5sFpdhmM2GNYQ>
    <xme:oC6YZ8f0cQXKuFI1y609kpDuWbUx87IJpzsXX6MG-QbsfOVP9Ou_oO1FbWjMibdY4
    0fLjxiTMthdWyKCTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgudegjeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedftfihrghnucghrghlkhhlihhnfdcuoehrhigrnhesthgvshhtth
    horghsthdrtghomheqnecuggftrfgrthhtvghrnhepgefhgfektdeuieduueekvdevvefh
    udeuhfehvdeigfffudehueeiieehhfefgfevnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhn
    sggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepfigvnh
    hssegtshhivgdrohhrghdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhm
    rghilhdrtghomhdprhgtphhtthhopehlghhirhgufihoohgusehgmhgrihhlrdgtohhmpd
    hrtghpthhtohepmhgrtghrohhmohhrghgrnheshhhothhmrghilhdrtghomhdprhgtphht
    thhopehufihusehitggvnhhofiihrdhmvgdprhgtphhtthhopegsrhhoohhnihgvsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhi
    shhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhsuhhngi
    hisehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepphgvrhgvgiesphgvrhgv
    gidrtgii
X-ME-Proxy: <xmx:oC6YZ-xaROToKlvlj2JmOZDqieFzTUgnLMYCfnFV7OnENNjYNp0NMA>
    <xmx:oC6YZ6MqPlmJssMktbVS3zjWHlqlF5TLhci4YXcFyejlD7jOeXlz8g>
    <xmx:oC6YZ79dTr6S0gJI322w0ubHmXLmeDsEB67JjVrFMK8EL-cssukNwg>
    <xmx:oC6YZ6Ugkv565B2m4tjlNC1RJC4HDq21Mq5fD0Vxn7dPRlj1Xsl_9A>
    <xmx:oS6YZ-W19g9RCkHYsRP3Ba6glrUiwjZYmtH1UcfzfZNr2LZ1Fn8b4msU>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6149EBA006F; Mon, 27 Jan 2025 20:10:56 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 28 Jan 2025 14:10:30 +1300
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Icenowy Zheng" <uwu@icenowy.me>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>, "Chen-Yu Tsai" <wens@csie.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 "Chris Morgan" <macromorgan@hotmail.com>
Message-Id: <c5ade280-d607-4870-a4e0-7d455f6bc6c3@app.fastmail.com>
In-Reply-To: <db43243ea653073d223e640f064cd480da7e2cf5.camel@icenowy.me>
References: <20250125070458.13822-1-ryan@testtoast.com>
 <20250125070458.13822-6-ryan@testtoast.com>
 <db43243ea653073d223e640f064cd480da7e2cf5.camel@icenowy.me>
Subject: Re: [PATCH v2 5/5] ASoC: sun4i-codec: change h616 card name
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, 26 Jan 2025, at 8:51 PM, Icenowy Zheng wrote:
> =E5=9C=A8 2025-01-25=E6=98=9F=E6=9C=9F=E5=85=AD=E7=9A=84 20:00 +1300=EF=
=BC=8CRyan Walklin=E5=86=99=E9=81=93=EF=BC=9A

Hi Icenowy, thanks for reviewing!

>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0card->name=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D "H=
616 Audio Codec";
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0card->name=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D "h=
616-audio-codec";
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0card->long_name=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D "H616 Audio Codec";
>
> I think it's part of the userspace API that should be kept stable.

I don't have a strong feeling about this change, but can anyone suggest =
any other options for how to manage this name being picked up by UCM as =
a file path? I guess the UCM paths can include spaces, but this is sligh=
tly unwieldy and may break if proper escaping is not done.

Would appreciate if any of the ALSA devs could weigh in on best practice=
 here.

Regards,

Ryan
