Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB5538889B
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Sep 2026 19:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790018656; cv=none; b=cUky7K4jwBNZXeBg8ORhJ7B3osLvsL95eusb6vZIdpnBENOLSeMfpscIJ7cdN4DNwG+Hk+M0bo91Q+ymeLzM2wj7Z72Bq4TS5rqL1Za88XzFX+xlTUOk6oJXMVJMjZ4CXItdoVGmYMCJerKOyAskOHEk+mx6b9q7/5wtSIOXqj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790018656; c=relaxed/simple;
	bh=7CQo//H0Q7Avz6tSf1FrW+CH7bCKd0ShU1A2uXjAJT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ufz7UXPVk1eHjqDVRJsml5/fu0DgDkZOPXHQ90dSf62PMVMbcMYqIW09XWUZiZXMz7cXe0zLWPI+yy+6wKPE7JvW32V6NYRLrv/OQqPlgjyFxPNZqSSpvt/H1inJWkF1vBUeAnkHB5UwFM/WRZ5S+sen53mRkUWDj74LcixyXmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EMFNeLNg; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EMFNeLNg"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 406931A0F5C;
	Mon, 21 Sep 2026 19:24:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1243B5FFB2;
	Mon, 21 Sep 2026 19:24:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D8A6103291F5;
	Mon, 21 Sep 2026 21:24:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790018647; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=e3BrU3adXd7hifuN5T966IaOlrTNSgLHaVwZw2bQJpQ=;
	b=EMFNeLNg+y40EYrMNTDJwRB17KtfVR4P3kmJl1I3fegJ9k+JHWQJ5pJlGmzYTXy66ni0Fh
	sSbuL1w77SOp5WCN57Sji5B/iYlyrxuD5m7IpXuzlIYOCPCv6u7ZCXwKi6udRRtpPj5igB
	KfWEXB9PyfU5Uc4OSld4XgWSdnHPuhyJZ0AfRMZscR2rOigbO4/YmOIr8fjDSemZEWQh+H
	UAmfFt85OFHoqUDPJLK+RMnbBXC02ZMS1IructHEMAzuNZDAE+55LTP/xZfJ3svkHrY4Be
	V5aXISTVX4NWuHfqNryVxYy0qgH4e2DaIxD1ySkLcJ4cj+bHnh7l1qk0nja86A==
Date: Mon, 21 Sep 2026 21:24:05 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Aamir Ahmed <elb12345@hotmail.co.uk>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Chen-Yu Tsai <wens@kernel.org>, linux-sunxi@lists.linux.dev,
	Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] rtc: ac100: Assign .num before accessing .hws
Message-ID: <179001863789.246818.15549615355312065254.b4-ty@b4>
References: <AS8P251MB00013E724A77A355668B6CCEC8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8P251MB00013E724A77A355668B6CCEC8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
X-Last-TLS-Session-Version: TLSv1.3

On Sat, 05 Sep 2026 19:38:08 +0100, Aamir Ahmed wrote:
> Commit f316cdff8d67 ("clk: Annotate struct clk_hw_onecell_data with
> __counted_by") annotated the hws member of 'struct clk_hw_onecell_data'
> with __counted_by, which informs the bounds sanitizer (UBSAN_BOUNDS)
> about the number of elements in .hws[], so that it can warn when .hws[]
> is accessed out of bounds. As noted in that change, the __counted_by
> member must be initialized with the number of elements before the first
> array access happens, otherwise there will be a warning from each access
> prior to the initialization because the number of elements is zero.
> This occurs in ac100_rtc_register_clks() due to .num being assigned only
> after every clkout clock has been stored in .hws[]. With
> CONFIG_UBSAN_BOUNDS and a compiler that implements __counted_by (GCC
> 15.1+ or Clang 20.1+), this triggers an array-index-out-of-bounds report
> during probe, and with CONFIG_UBSAN_TRAP the first store traps.
> 
> [...]

Applied, thanks!

[1/1] rtc: ac100: Assign .num before accessing .hws
      https://git.kernel.org/abelloni/c/6a4117eee82d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
