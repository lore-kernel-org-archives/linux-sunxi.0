Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E3D1A2397
	for <linux-sunxi@lists.linux.dev>; Sat, 22 Feb 2025 23:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740267526; cv=none; b=RPX30Lh2tSu4l4cYmvK/GFgzLrFDeNRLfn+fKoH7NKkdp/t5HDF1U52ZVbyRVSrAYMz9kTU0T711jj0Q9lFsK+XN+GsFsM7enh1VzaOOJd7BwoQ1dZC5yx9D/KeNCu1DRPsDdZmRm2jZHuacDCd2sPlAoIC5XDdxbL1MQdZFQHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740267526; c=relaxed/simple;
	bh=B/JYCuAOPNXUs97OwBfYUxRJP2mAf26Jo+qf9gyq+hY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=WUSSu+K8t7dYQv17DaBmg8UH2DbuIp/zmcODY+IihWzM7QqwOckunGym4g21RjyuEMlgRm5F6cCEa66LSYdteSd4MZcdkUs/K01jwHDIdBUPA74TxqFNBhWFekMZwsTMzo3hFIeVlRMEIgquQalRprxZ69GvIhpwEVTPpdKUTLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=GIkau96R; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=t648Ddsc; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="GIkau96R";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="t648Ddsc"
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfout.phl.internal (Postfix) with ESMTP id DBF8413809A2;
	Sat, 22 Feb 2025 18:38:43 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-13.internal (MEProxy); Sat, 22 Feb 2025 18:38:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1740267523; x=1740353923; bh=MiOEycHuyFaMnajcbN5jU6iu0/61AYqi
	xlcUkD5N0Zo=; b=GIkau96R5ES1g67g8DMRo9dKqBHrc3oOyxVYPJR2LxwN97iU
	xRuFvT3LBNGLeVD6UTTPjE+2eftZQhWqnYu9/7D7rpX7WC7WxQf2WYBFDAxXCl62
	o84pvoobC/NcRWj+tzDAkQgasdTwPSBegGVMBd4dvFBGM8jjtFAwmY7QRPtbnLPX
	qfVUk9qJOF7bTWEdJyWBFmdd8ctDNOOjOGY1fzM+iAyKrrImGJltC72JEdPJCLX3
	frxNYc6DIs8ksVrkV9A79CXr6hZmAMPAHHYW32PsMlT7A6FMLis2cROaNAbR1QR6
	kGVBGKU08Q83zv1VgPmxleiLWxpxTij0Dmz6TA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740267523; x=
	1740353923; bh=MiOEycHuyFaMnajcbN5jU6iu0/61AYqixlcUkD5N0Zo=; b=t
	648Ddsct3fbCKUHRJckAIoiPudMGbjD9cgpVv20PsaloSaSCq0ALg6Q6yy7j5kW/
	vFJQVxL1SeFJtahT1Fb9C4rclrziXcko4Z35D2tC8qW1b71085zeyTgLrx0RwOKZ
	Etz2iGkA5iaESNLiV7PdE4IxycaHYgmhSH6MoCwTUQSCVG8FQpWHJP/eXHuKkR38
	uqLxD1MMwHKi4hI+VwdVy1RGlkv3ALZTihYwqaBOvz83ef7P8gNYDJJq1HS8MZQt
	ffXyIQOsU7e2Sxon3Jll/O8NtvnNb/rgO9dRql0myiB4xMhIdCOJp39m2UDyFz9m
	m3hNxAJ4fgmHlfNylPUaA==
X-ME-Sender: <xms:A2C6Z9nVwVpsd6jYLsZQLsW27ELamhd7nLaEOmsGedeNua9GQ2z4Jg>
    <xme:A2C6Z40fq2S_uuueb-e0vYW_hksiCjnZdcUSLuKr0eGatS3kTvpZ51SfHkGUfi7cH
    _OYtYBzi-JgyxuXSA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejgedvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdfthigrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtoh
    grshhtrdgtohhmqeenucggtffrrghtthgvrhhnpeeghffgkedtueeiudeukedvveevhfdu
    uefhhedviefgffduheeuieeihefhfefgveenucevlhhushhtvghrufhiiigvpedunecurf
    grrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgs
    pghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurh
    gvrdhprhiihiifrghrrgesrghrmhdrtghomhdprhgtphhtthhopeifvghnshestghsihgv
    rdhorhhgpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtoh
    hmpdhrtghpthhtohepkhhikhhutghhrghnleeksehgmhgrihhlrdgtohhmpdhrtghpthht
    ohepmhgrtghrohgrlhhphhgrkedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimh
    honhhsrdhphhhilhhiphhpvgesghhmrghilhdrtghomhdprhgtphhtthhopegtohhnohhr
    odgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:A2C6Zzp1ke66Zmn21S1pPC3Ti3mYtnTt2maYI6zt5RfJ2VQCcnAtwg>
    <xmx:A2C6Z9lxnOVm7z9acTexu00fOjg7l5C3rJJsewn9WJ5L5_RFNEnVKQ>
    <xmx:A2C6Z70zNbBIWEbvN2zsaALwzf3IF_scA6Ou6yW45LeNU9b8hd0YRQ>
    <xmx:A2C6Z8txRewr0cq17bd4zasreCMdOsXR5VWmEMZ0pfJOtQluNk4Ueg>
    <xmx:A2C6Z5MO5xGiRnssMsRGpJo4SnlCx6QJUOjf26l6Q0AxCZrc2e-DkO-w>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AF663BA006F; Sat, 22 Feb 2025 18:38:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Sun, 23 Feb 2025 12:38:12 +1300
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
Message-Id: <33762e08-d58e-4523-a016-d9768172c77b@app.fastmail.com>
In-Reply-To: <9408152.CDJkKcVGEf@jernej-laptop>
References: <20250216092827.15444-1-ryan@testtoast.com>
 <20250216092827.15444-2-ryan@testtoast.com>
 <9408152.CDJkKcVGEf@jernej-laptop>
Subject: Re: [PATCH 1/8] bus: sun50i: add DE33 compatible string to the DE2 bus driver
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, 22 Feb 2025, at 10:35 PM, Jernej =C5=A0krabec wrote:
> Dne nedelja, 16. februar 2025 ob 10:27:08 Srednjeevropski standardni=20
> =C4=8Das je Ryan Walklin napisal(a):
>>  static const struct of_device_id sun50i_de2_bus_of_match[] =3D {
>>  	{ .compatible =3D "allwinner,sun50i-a64-de2", },
>> +	{ .compatible =3D "allwinner,sun50i-h616-de33", },
>
> Since there is no functionality change, just go with h616 compatible w=
ith a64
> fallback. No need to change the driver.
>
Noted, thanks.

Regards,

Ryan
