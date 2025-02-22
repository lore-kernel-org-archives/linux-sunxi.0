Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C481A2397
	for <linux-sunxi@lists.linux.dev>; Sat, 22 Feb 2025 23:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740267678; cv=none; b=iH91QIJ+rP/VT5jIHb27str6faWE4+QXjottKJ6GKiUnUpV3GlhR5B/TWhOd22xIMZikHFnfxo9Xc8l3+gnsrnwvLYxtpR4/Xy++EnH+vtrNkS3Jd2BaOM50Xu0MAzBe6dtDRUI3BhgJZZOdmccDSnDb28OerB36Q5yoyi5HoBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740267678; c=relaxed/simple;
	bh=+KnZ+bHpq3Adbno5MHK+SYpaXqn+rPN2eRCC8cungUg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=lr4MehC+1xG989WwBU0DkcgGJA7ZdBQ7JkSe/6Gs6T+LBBajC9LWJj4+SBVUOEZ2UNLqo5kkZJOhrlnTPTrI9BU0FVCEf6eMrhTEsIXuBmWaXgn4MSO8SILY4nlI0BfhkQQbrhJ1xFge1z6aPvQ2hPOTQP6NUIeD3gA9eCkZNww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=VIPasXYg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NqROBFzd; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="VIPasXYg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NqROBFzd"
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfout.phl.internal (Postfix) with ESMTP id B4394138098E;
	Sat, 22 Feb 2025 18:41:15 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-13.internal (MEProxy); Sat, 22 Feb 2025 18:41:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1740267675; x=1740354075; bh=+KnZ+bHpq3Adbno5MHK+SYpaXqn+rPN2
	eRCC8cungUg=; b=VIPasXYgFYZXnBRT1VNix9zYrQg+fBuQiS88EXgxYAB3w6fM
	hG8bytPl4UWmCOkwi8OrrxMaHhaQsf1oDNv3nbj52/CgFOFjb9zTt0pJTbrEmfS1
	Kd4BXEKhmxFJgB5DRz8tyAF6pMzSML1B88z6MjYyFlzbp2JNdxi7W1Gm54VtoePR
	XDCBdvhLMnrP6AZVJfkRYkg9IIQRltVI8PT1AX4a/T7xqXcmPLbmnkS79SdwdTR9
	CDtSxzpSTYmPd1++v/zMRsiYKDaNBA6C1O26/LMUwmqfL6gocs85H2qyxMkO4hGc
	6U7yivCuajyWMz0QbnEt3JLuRp5RMnzlGx4e1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740267675; x=
	1740354075; bh=+KnZ+bHpq3Adbno5MHK+SYpaXqn+rPN2eRCC8cungUg=; b=N
	qROBFzdGqd48ACpHZMA4RQ34K7/CbqYwDeYRuhd1zeswpqR8NstOCAD3RW6pZ0PV
	BH4Myiec7K4535df5NABB39sKb2v1Nsnb9cNPrQaELABK99IXcXXKpRQx/zU4Id0
	e+AG8gjDbU7DC9LoM75jT9eNH+V+Cc2MuToBDmlt33KrI9zNH9V/3TcVByow01MS
	xANEZM8QUIr1LBdPygppUWtrCPD4+VpELOwBrs95DP7kychTFjA4jY+HFRuJLWg2
	B5D7YJqHQI/3klc8qeJy36VqXj2fKha/0Uz7MHrJsNDqRS/8f++/tJesbCq5Kn2d
	Jw41AOvaWMaXA9odMumaw==
X-ME-Sender: <xms:m2C6Z0CKr54xzCZX3ePLmZ-I3_J8CBdmV9SQzSf2YfQcuvpOIPgUfw>
    <xme:m2C6Z2h56YFUIJyrkBEW1M3usrm2Imq4dWgW_TI4gYBNeD3r1s5o7TgkcaDH3ZAM2
    fLm0D2CdF9fNgtSiA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejgedvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdfthigrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtoh
    grshhtrdgtohhmqeenucggtffrrghtthgvrhhnpeeghffgkedtueeiudeukedvveevhfdu
    uefhhedviefgffduheeuieeihefhfefgveenucevlhhushhtvghrufhiiigvpedvnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgs
    pghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurh
    gvrdhprhiihiifrghrrgesrghrmhdrtghomhdprhgtphhtthhopeifvghnshestghsihgv
    rdhorhhgpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtoh
    hmpdhrtghpthhtohepkhhikhhutghhrghnleeksehgmhgrihhlrdgtohhmpdhrtghpthht
    ohepmhgrtghrohgrlhhphhgrkedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimh
    honhhsrdhphhhilhhiphhpvgesghhmrghilhdrtghomhdprhgtphhtthhopegtohhnohhr
    odgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:m2C6Z3l5vCZ3r4nRVTB4zUpEz5Zm54INr-rWHDQLOnQHOblRzgxhbg>
    <xmx:m2C6Z6za0QFUiDxuRCN17QEN8gJRBnllq3-hmjctAHdfqAhTsVTbhQ>
    <xmx:m2C6Z5RnpEu3JDgm9R0IL7k7oZEjZaCYpKK1TW6XVU20H-E7UPqejQ>
    <xmx:m2C6Z1auZT8EbfpaOZTeBjtGkqQvf5IBDZRSxVV2DtO5KX8LUAtvyQ>
    <xmx:m2C6Z4JhcubZ1qsHl2-1f2nPREQtGv81LjK19ySJq6RnFgtmzhfE94vK>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 854E6BA006F; Sat, 22 Feb 2025 18:41:15 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Sun, 23 Feb 2025 12:40:54 +1300
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Chen-Yu Tsai" <wens@csie.org>,
 "Samuel Holland" <samuel@sholland.org>
Cc: "Andre Przywara" <andre.przywara@arm.com>,
 "Chris Morgan" <macroalpha82@gmail.com>,
 "Hironori KIKUCHI" <kikuchan98@gmail.com>,
 "Philippe Simons" <simons.philippe@gmail.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Message-Id: <840e7248-de05-4c96-b743-917649d71dfa@app.fastmail.com>
In-Reply-To: <4407188.ejJDZkT8p0@jernej-laptop>
References: <20250216092827.15444-1-ryan@testtoast.com>
 <20250216092827.15444-7-ryan@testtoast.com>
 <4407188.ejJDZkT8p0@jernej-laptop>
Subject: Re: [PATCH 6/8] arm64: dts: allwinner: h616: add LCD, LVDS and PWM pins
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, 22 Feb 2025, at 10:48 PM, Jernej =C5=A0krabec wrote:
> Dne nedelja, 16. februar 2025 ob 10:27:13 Srednjeevropski standardni=20
> =C4=8Das je Ryan Walklin napisal(a):
>> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>> Add device tree nodes for the LCD, LVDS0, LVDS1 and PWM pins.
>
> Let's just drop PWM pins. PWM support is not yet implemented and it do=
esn't
> fall into display themed patch anyway.

That's fine, this can be re-added when the PWM driver is implemented, an=
d will squash the backlight and panel nodes in the next patch.

Ryan
