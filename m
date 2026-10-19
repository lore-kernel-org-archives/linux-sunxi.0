Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440750;
	b=pyVNTzTrr1g3AueIGf4GaZAqe+Wnz6AKwcwGvWNJX/L3VraizEOs2dXsuLZX8Y8t5wJX
	 kFKqHiH5tQPeXzYXgFfSy4NrQhMbyiJCVueq4XJKJSBRj+vRev2TY2dl4uNclnXa9awfb
	 nNmBHwGedWnzCgAwWPrPisoFdH7hOxiIf6IpHV4lczDZQoJzewXvhfFxjZ4wfNXwVeJXq
	 0jjhHOe1H6c72ZXewbNp0qXhvq48f5ylyw9jvkr/NhjKL0bSULIv+GJi2mPel5oOj1uaG
	 RRibRU0JHzm0GuKPO8OJgLoBfzl5F4wP9oFOWcscIrc+kwJHD1v5t95OndIGD5Qfqvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440750;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
	bh=LTRlnK1nXG1mmQO++Uq1vusm9ibIA0GFtmdvXpx6u5o=;
	b=dFbcl/fZr84U8DOOCoQerxff7Sn8Kk4BlvnFHbCNU921LKwjRY4wVSTDLkMRZFY7aTRE
	 WSChWHmo4OVp8YnB+wtCb9ZlIZRoJpvmYM/8UKU6466cUG1eFZ+L4REVU9diaopXPh6Ma
	 RPgmTw6BMls2chhWE6TwuWUODEQFOGIT77++c2//h6/ppPnManKFFjxMVfvK42W033NNw
	 y/s/wQ/tW1r13K54RJMWtgIlQaIJhE0m3RgnaYOHbNJZWVK2fuD+xTLo8iwWm6hEHg4Ii
	 tszO69VCxHdU64IT/+GfY9bRg9vTHzd6cotSSieGFmslnkbKMrlX4EqPxWN/0gabijA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pMkKdZes;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB87606A31C
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Oct 2026 20:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFB87606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pMkKdZes
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 77ADEC5CD5C;
	Mon, 19 Oct 2026 20:13:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A33D60582;
	Mon, 19 Oct 2026 20:12:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1DE9B10328C22;
	Mon, 19 Oct 2026 22:12:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792440747; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=LTRlnK1nXG1mmQO++Uq1vusm9ibIA0GFtmdvXpx6u5o=;
	b=pMkKdZesfYONkSLVd9w2zfn0x1bHOEpUnypkBOSqlSy0pjCpzKYspdAir5JIiYpA40Tyfr
	EjcgZ0DJVHZHo05EHCXI/BO1+GZvL/FP5Dqyjdhi6X2XJxY/4ZTOjmVU5TMe8AS2ZLgQw7
	uQ2gOhWb/KlcpBNkqlaTZlqGKb43xH4c2jA1eNPntVW1/alFEj4xd6w8iPGXsoUYJZ3/Ca
	iNkR4NZonej30f4Ulf7DfznKNCnGACq64TIyDyKomVVDWuTq8KNvGO4Tb2y4X4BWVo/pPF
	UblefzjSbKKriP8AWBpFPn1TeEjVoYrr+i5HxyGlyEOuOuEegW9c7eboWvvqHg==
Date: Mon, 19 Oct 2026 22:12:24 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [PATCH] rtc: sun6i: fix error handling in sun6i_rtc_clk_init()
Message-ID: <179244056613.104236.10835769446499654446.b4-ty@b4>
References: <20261014193220.38055-1-pmazzini@gmail.com>
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
In-Reply-To: <20261014193220.38055-1-pmazzini@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 14 Oct 2026 20:32:20 +0100, Pablo Mazzini wrote:
> Set sun6i_rtc only once all clocks are registered, and unwind fully on
> error.

Applied, thanks!

[1/1] rtc: sun6i: fix error handling in sun6i_rtc_clk_init()
      https://git.kernel.org/abelloni/c/2d6f97296143

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
