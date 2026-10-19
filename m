Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440774;
	b=lOoDFo4kYvhJhm3Ugf0rpCHqt2TAMkJrd78hRXe9KWQaQhbROrrT0NfCVR0iXvNBHE6s
	 iu7MfdWdaJRtUvPA5bolgdiEqY/N5RSchUlUC2lNeIS6W7ogXOCo+jSPLtbXLSLT7P4C6
	 663SsV/rMCANR9oHj5O0j6xByCx0xWc0w2ExIo5JhhAPp83KhtD1lpRu3psBhACbStC/7
	 0jB896gnoCGzhDDQ7LrTFeYZUfv+bkwdSiyUWeUF6DDIBNd/v0huFeg5JV6d3toxjLVLX
	 KMn8qrU2UqARsYyWv5T4oNRUrltNVNHC6degkmJXzwrW0aGA55vWxQKdXdUEWyJdEvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440774;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
	bh=bhtdHmlzv0DKoEw+Zc7TOwdDACTcoyGMeQ8adip2B7w=;
	b=LYND8Lkq7MqrmG09BYZ1apEdjfQV/tZ03tQhUFckZX+hcpCudAq9OKAW4JnJlnFviG59
	 bBYjBJqn9yqsfvSGdFJS4dlx7XmyYEIkBSQz/p8zNxRWKTBAF8JF1H/bWPdl5LF0Jrk1H
	 V7xdx+qCXrViT75PQGPH/sPFTwYHATYnC85OM7moAQYHb0JnJa3pwdLYGeq3gi8+c7SXW
	 DsSM/zeKiIwZp50Lw3dK5ijnnGVg00rBd4V6e8V9B6ljMbpYFwFM1q8rRoXXgZuqy9yam
	 viYbzuOItnumRVDVlrBFImK+D1zkNK+9Vr3O71jUHIwPffw5H0PKM3BqzGjJqGTZ+bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="Pa3/iQqA";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09CD606A320
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Oct 2026 20:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C09CD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Pa3/iQqA
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ED10F1A124D;
	Mon, 19 Oct 2026 20:12:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B800F60582;
	Mon, 19 Oct 2026 20:12:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A795910328C52;
	Mon, 19 Oct 2026 22:12:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792440766; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=bhtdHmlzv0DKoEw+Zc7TOwdDACTcoyGMeQ8adip2B7w=;
	b=Pa3/iQqA6vAUfEWx2TIhJVrvDVY1bNti3mgE+dD437CyxrCLMqTJ1ErML4wYetDTmcOhYK
	PGq7h9FpP9dgS6Ncnd/AkqwJYFSPAxzZpb4yCCAjWY741cXlg2eGwlHYPABmg57+gc+sf9
	MbVZ5UeAITIRMWz1Eh3/oQAh6vsciD1LpJEyq2XrUfqG5VY2iX+lZm5FyMaQrAOn06ueNZ
	gi26YmOton3sKCyOeJXz0LOqt71W7hYVDciazQm48/qe7tvcsRlzC/6olMpGP/ez9o+f2V
	tcsQpXF00uQ0CStVQxb/29i3zXwo+y347qLAYTuhPpZg18W8E8lWlZjzlv/mqw==
Date: Mon, 19 Oct 2026 22:12:44 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Pablo Mazzini <pmazzini@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-watchdog@vger.kernel.org
Subject: Re: (subset) [PATCH v4 00/11] ARM: sunxi: add Allwinner B288 and the
 PocketBook Verse
Message-ID: <179244056617.104236.5769731153552958433.b4-ty@b4>
References: <20261012100816.331033-1-pmazzini@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 12 Oct 2026 11:08:05 +0100, Pablo Mazzini wrote:
> The Allwinner B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book
> readers. This series adds the CCU and pin controller drivers, the RTC,
> I2C, NMI and watchdog compatibles, the SoC .dtsi, and one board: the
> PocketBook Verse (PB629), a 6" reader.
> 
> The B288 is closest to the A64: most of its PLLs are bit-identical.
> The clock and pin descriptions come from Allwinner's BSP, cross-checked
> against ccu-sun50i-a64.c. Tested on a PB629, boots to userspace.
> 
> [...]

Applied, thanks!

[05/11] dt-bindings: rtc: sun6i-a31: add Allwinner B288
        https://git.kernel.org/abelloni/c/51f30cb855f0
[06/11] rtc: sun6i: add Allwinner B288 compatible
        https://git.kernel.org/abelloni/c/3784706c87c2

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
