Received: from out-228.mta0.migadu.com (out-228.mta0.migadu.com [91.218.175.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC73A19BA0
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Sep 2023 21:51:12 +0000 (UTC)
Date: Fri, 22 Sep 2023 07:35:19 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1695333070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QqdCzsBT+posAOrgjqZp1RU0wbImVm1bMLt0YyYT58w=;
	b=jvHndayovKeUtX9KhNDnrwvpHYFAY3TGK25k0jym2yigvLtNswLLxKT6Iy0gnikZPeX0Ea
	9E+iGa5XeByTvqs/zPZqR1u20L7keWeogvvrl433gR3hgExeYnV91T9Q1Wb9KDJ4Ic91lH
	DRkHzMDCMUsHvHVQlZao+wq6tDL5sqbHKJOX/eVy2cbLpLzp/p7RhaKUdDs63DArSV80Nc
	/0UlofEZsEnKUE79VvJQDZOheJCmXNIeKvtMomamt0kJgN1KUChQ1Cxln1n7tKHWhQb3o5
	kUdDzQD+B+oIiLbouzSjs/cLjOvw7xVyOynXPFGXyMx4hAB2VRXRIh8v5sZTtg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Aleksandr Shubin <privatesub2@gmail.com>, linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v6 0/3] Add support for Allwinner PWM on D1/T113s/R329
 SoCs
Message-ID: <ZQy3F_VtOL3XWcl0@titan>
References: <20230824114038.891493-1-privatesub2@gmail.com>
 <ZPfn-0OAL7-3DCmt@titan>
 <20230921212736.nw6ctlimtrxfksbu@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230921212736.nw6ctlimtrxfksbu@pengutronix.de>
X-Migadu-Flow: FLOW_OUT

On Thu, Sep 21, 2023 at 11:27:36PM +0200, Uwe Kleine-König wrote:
> Hi John,
> 
> On Wed, Sep 06, 2023 at 12:46:19PM +1000, John Watts wrote:
> > On Thu, Aug 24, 2023 at 02:40:24PM +0300, Aleksandr Shubin wrote:
> > > This series adds support for PWM controller on new
> > > Allwinner's SoCs, such as D1, T113s and R329. The implemented driver
> > > provides basic functionality for control PWM channels.
> > 
> > I have tested this patch and earlier versions successfully on a Mango Pi MQ
> > Dual and verified it outputs a PWM signal.
> 
> If you want that documented, the usual thing to do is to include a
> Tested-by: tag in your reply.

That's a good idea! I'll take a closer look under a scope and against the data
sheet and give another tested-by then when I can. I'm not sure how close that
gets to a reviewed-by but I don't have the experience in driver development to
know if something is off in the design.

> 
> Best regards
> Uwe

John.
