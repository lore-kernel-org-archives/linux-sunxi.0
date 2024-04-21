Received: from wfout6-smtp.messagingengine.com (wfout6-smtp.messagingengine.com [64.147.123.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63C71843
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Apr 2024 02:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713665146; cv=none; b=onV8x9JmTmmti1ZU3M2twzwiCHSeemVeL7TP4oL4P711W6j9xYwGAa5kmAQN7CTBSoaZiimTwpQ3oipchi+CytG1Ah1ZSOQ3RsuwgiKZSigaA73XC7L20Ydp/QK8Ya6r8IDEZBn8Yp6lUq8ArbG8Rp2RrZTqqGN6q3CvCHxdR5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713665146; c=relaxed/simple;
	bh=HB/4XgsGiInPsVY0eYnbCI/gVH3tI3gGqc5hVAwy5zY=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=MSa2TWFXhptCBUnRyE0hejq9P2QU2UDh23UAJMTpAl4PH0AWIc1x4DatG8uqWHetPI0hBOFmvbCh2gpbw2koaKCgnvy2qariz/FZzTctTclfXALiTZSMg/r1DzoEcbZTtsOnDz12KiuzUzhCjlkI/rEw4Rf9Yj3Iqalv2efY/MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=PnMORuza; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ajdRl7Dj; arc=none smtp.client-ip=64.147.123.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="PnMORuza";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ajdRl7Dj"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id 1DBCC1C000FF;
	Sat, 20 Apr 2024 22:05:43 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute5.internal (MEProxy); Sat, 20 Apr 2024 22:05:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1713665142; x=
	1713751542; bh=En32aJrMQ/0Gzak9gE/0H5E2giTlCwXJ+O3be82usqM=; b=P
	nMORuza5G6W3CwHGkAWtBCX4sN3CSEfi3AnwrZNOQ4Prdkcy07pCYmgcIp2SYrCw
	ZPpqVpND4MEsf8xEek2phM3RuHBFckMylen/LpxpaePVA6kmGOKwV5JnU3rbMe8a
	6YEuL13nu7QVMh7HvN8IMiyyNizGFm34+ahEWZjRLw8/FLT1iASebepi7b4AD8Mt
	a0RUDVYB0D66D6D5Q7pQWrmuZojX97Igt05arLPM091P1c9joCth1waUftIL+QdQ
	mSJTsVM2jOAhMm1EYlaRiGASrk7KWtfXzN3uqQcgtOu+s2KAdayBREFbfws2q+7U
	yaE1rPKODdtap4iJ2b3IA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1713665142; x=1713751542; bh=En32aJrMQ/0Gzak9gE/0H5E2giTl
	CwXJ+O3be82usqM=; b=ajdRl7Dj5uzcuOaz9C85G/sI3bIZv4nbJZ1Z9OwTNr5b
	1+jf+gI55fElI+4YuFRNKS0gnuO5GbLyaqxWEJm/hSBTozz4IkZ5lsoKdYpvZk+c
	OWg6JZ2RDP/vypALx2JcSAp4EVeSIF+9PpPgrSyZd/Jlx55+DC8Ql4dn0EkgwWyT
	y3zTyoS2LNMtb+S6uP8Dq9jdYVFDHef41YSw7YjgHgn10lv6cDjWQFGNYW508nl6
	pIe0L25eQh1OsLn8wujQeyMxE1hP72tlAIhI9hUTtaYlspsD1xE5Ps7nvsEmTjNd
	rmjkRwDMm8fN4M6W84SRjZMgciEthxoisGjmZGGv5g==
X-ME-Sender: <xms:dXQkZoAUY7xN1txSCLiFqAxVlG1nRdQEwZRNrvhqtJUGGspeo95wvw>
    <xme:dXQkZqjWkGg76w1us623DIdci0EqYXqwJ0h8KMtN-vTn9foqBxdaiOjp0lggKXqkF
    8XZmoFn7H-T-tBlMQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudekhedgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftfih
    rghnucghrghlkhhlihhnfdcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecugg
    ftrfgrthhtvghrnhephedvveeigedujeeufeegffehhfffveduhfeijefgtdffteelgfet
    ueevieduieejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homheprhihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:dXQkZrmtxjD3mQWj4aa6VinM2g0YH4Qdpvwt9puIkP4E4PmhQrbdyQ>
    <xmx:dXQkZuyZGx7RG8koIJDWej2EcUh6qBHHjjpIBzgYNduUgXcxppT3cA>
    <xmx:dXQkZtRV3mfGoK1IAk7DZEk47pviAgC4NQJ0jOsThgu_OHO4pgbdzA>
    <xmx:dXQkZpafHXN1sTbHonleIl5h_nxJ7e546xkfQ-l1CfvX5LTS6wx_8w>
    <xmx:dnQkZiIFlhB8GXHbTU5YESN8cud_wxRJ2-JrFs0p_dWIpzRK1Gf7VIJw>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9830AA61492; Sat, 20 Apr 2024 22:05:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <7e4d3272-c1d7-456d-b1cf-fd80dbe396e1@app.fastmail.com>
In-Reply-To: <37ec07c5-5235-4356-8ab2-ad09ddd58347@linaro.org>
References: <20240420104354.334947-5-ryan@testtoast.com>
 <20240420104354.334947-8-ryan@testtoast.com>
 <37ec07c5-5235-4356-8ab2-ad09ddd58347@linaro.org>
Date: Sun, 21 Apr 2024 14:05:21 +1200
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Andre Przywara" <andre.przywara@arm.com>, "Chen-Yu Tsai" <wens@csie.org>,
 "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>,
 "Chris Morgan" <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/5] arm64: dts: allwinner: h700: Add RG35XX 2024 DTS
Content-Type: text/plain


>> +	   button-up {
>> +		   label = "D-Pad Up";
>
> Please fix your indentation to match kernel/DTS coding style.
>
Good spot, thanks!

>
> Best regards,
> Krzysztof
