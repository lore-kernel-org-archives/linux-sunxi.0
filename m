Received: from out-96.mta0.migadu.com (out-96.mta0.migadu.com [91.218.175.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CAA8462
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Aug 2023 06:30:34 +0000 (UTC)
Date: Fri, 4 Aug 2023 16:25:42 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1691130632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fnyyMjp6/z58rKII/Rp2mOpVsSyBs8OQVRiCTOvwHzg=;
	b=rU5Afm+UogipGA1Ghu8dxKZ9+UgBF3vyzWvmBEaKnN76hnXKL3M7yZ+l8cSQasw3LtH/Bd
	BvMHgwnV0Dglp2WwL+J2xzkGh5fOtpFDIRgMxGDke8IUmWOtuDs1S3rSB0cZb7LUNfswYQ
	0pWAn3ewJ5Sw4dTiJGpqeVO0A3uI2Zqj901+ynSCkaEBpCMzjtj5psdXq8Emyz39UKaRhm
	DB4sssEAUyAxeWryzNAFHD6FCr3WbpN6L6tALdwc8uxdtAXxvRgkxQ5j0eBTNGszgZL9EL
	A7JYumZdKXnUbJEviPMcnMRGSLr6lAbaUTLUVER/RmASJN9Fz/KxHsiuVQMWPA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Maksim Kiselev <bigunclemax@gmail.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mkl@pengutronix.de
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Specify default CAN pins
Message-ID: <ZMyZ5kZSiiJHtdeS@titan>
References: <20230731023701.2581713-1-contact@jookia.org>
 <3248110.44csPzL39Z@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3248110.44csPzL39Z@jernej-laptop>
X-Migadu-Flow: FLOW_OUT

On Thu, Aug 03, 2023 at 10:59:30PM +0200, Jernej Škrabec wrote:
> pinctrl-names and pinctrl-0 are usually at the top. However, since there is no 
> hard rule (I've seen it mixed), I'm fine with it.

Happy to change if needed.

> Since original DT node entry goes through netdev tree, this should be picked 
> there or it can be dropped there and I pick both patches or I can pick patch 
> for later kernel version.

Do I have to do something based on this, like resend my patch?

> Best regards,
> Jernej

John
