Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE7832ED4C
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Jan 2026 10:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769422449; cv=none; b=V7LKBLRFuMUDAOMlhrp5gjkmoKVBuvligf99Vv9nz4I439JZFGyFc/SWWw170xl7KWDXiaegVmKEdAtVhajUcOihI9siKNNs5WdzxmmZcjYLUEJscA+KCWKxzl+80ftuLD0eZqK6NYfJrjR2+StKdC/MYzOOER+OkONMaPWERxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769422449; c=relaxed/simple;
	bh=GEyk04gNfaDNUHZdbx/q7WFk8xB7t1TzPA3X8P2/iwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DXVrbWBApWYK+KasQeIoqW+GAWlWd28mA4ys9j1qyG/5aU9p6H17FTppQ8M9rA877QycuomAB+x0Qe5uSCZEYxyeh+dlTMg9kQcV5U6coFtWrU4Q3WDHqL+51ZPc3acW8bx1Yr01KClP46lid1pUbqmKC8JJWIUZJy93EcC4euU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ji1bHKHt; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ji1bHKHt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=GEyk
	04gNfaDNUHZdbx/q7WFk8xB7t1TzPA3X8P2/iwA=; b=Ji1bHKHt+JBZnX/GqU7z
	GmELF2zecUHUYwHyPE0GxC0VL1PkUzKdJBdFVr9uITKO945DgETLiZd7J/Mghu5u
	aJkpZ868djWUjpJEXbv7yShzGmh9nUgq59lmLZa1AaMIuTObkqc4ePQ6w6Gi7k7B
	IRC7FIa0p3eYck4yCX0jbQMeyEsIaVAd3PEJ8WvCln5HlDjFpYEsL6sQRP6Sitcp
	K3d32gvQMzAzbPaOYUDYSGSqoIZeQ+DO9qE8qu/a55+6VhP3kVT/qsIEo9drNw5z
	nZj1toP3ofBd6T4B/BhlHdrOQMbE2kWmeCrdbC/87bGvWebZFlxHmtyAN1aWqBz4
	9Q==
Received: (qmail 2704376 invoked from network); 26 Jan 2026 11:14:00 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jan 2026 11:14:00 +0100
X-UD-Smtp-Session: l3s3148p1@rNv6w0dJgpEujnvz
Date: Mon, 26 Jan 2026 11:13:59 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andy Shevchenko <andy@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Waiman Long <longman@redhat.com>,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Will Deacon <will@kernel.org>
Subject: Re: [RFC PATCH 0/4] hwspinlock: refactor headers into public
 provider/consumer pair
Message-ID: <aXc-Zxw05XQLb1Dy@ninjato>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
 <aXc7DxsqiCGdfzxi@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXc7DxsqiCGdfzxi@smile.fi.intel.com>


> I don't like the idea of sharing internal stuff. Why would we need to have
> a struct hwspinlock to be visible?

Providers need it, especially the 'priv' member. Consumers won't see it.

