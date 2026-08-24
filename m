Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5903E92B9
	for <linux-sunxi@lists.linux.dev>; Mon, 24 Aug 2026 13:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787577409; cv=none; b=Ceukg8Ht5N61ilcsUAaRGSXiKGzbF8pKqR6TFn8DD2p3XR/80Hd22A9uwUMFAq8zL0B20FfB3mo4uGgsTrkH2EZGpzpHJmR3nvO/GLpj/opZeAZd1hm7uZe2u+vFLk9p87DeMzMgFsUx4Ty9rZ5nzzkSriiIY2Z+IilMBDcye5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787577409; c=relaxed/simple;
	bh=u69iDQDh65gTSQHaopk712AakCgClJSI2Zoo/JrTLeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=NDaPfzf5VWzzN9F37wZ3NIdOXxOm0I2OSPGEJ22XdXJn66XzfoQL89UfcPCb+QSk7xOjH4TXHewNno4w2awl9YUdMFq3RhsdN9e67KG9GI6jOOmWqCgoJ4jtOf30CG1uMn63JU2p/nNSdi/yyfXSv28+yh3U+Pcy8olYTFAYbAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yt2qQfWI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yt2qQfWI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787577405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a5uoZNVB2XRKnrTBdvCmJrG8M4XSoSEJo8KaXU4b4e8=;
	b=Yt2qQfWIpvra9OdM7gDDW3etGkeqEgtGb6YiRhLqOsf27nRSbUrfF6mJUa9/Jm+7hF0CA/
	Mx8vJ2x8NHR5UEZyHU7Vb93UVBj1V7Vc044wIY3ZzE4iU3tOMCgUkrmIkMJmcq9QXh6KEn
	2GLT1s9ZGLJB0PuCtZAiwbj0g++2RoA=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-mEUgQ3mcOo-JAgD8CcyI5A-1; Mon, 24 Aug 2026 09:16:44 -0400
X-MC-Unique: mEUgQ3mcOo-JAgD8CcyI5A-1
X-Mimecast-MFC-AGG-ID: mEUgQ3mcOo-JAgD8CcyI5A_1787577403
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-836cfd56077so51611057b3.1
        for <linux-sunxi@lists.linux.dev>; Mon, 24 Aug 2026 06:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787577403; x=1788182203;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a5uoZNVB2XRKnrTBdvCmJrG8M4XSoSEJo8KaXU4b4e8=;
        b=D3ErVXTaUjg81aL4bL4iEqQVDhmO/5IoBX6MeOATuzKvS+vbo1AsQxBJVSxdqi4hLa
         ASwa9H68DM+DdlkRFGaIw6BVHnelfvmeLHD3kJZXeYogMWCfjnrmxAkfEUDtNxGN5N5f
         1KOm2LdUw6/RNAmkdCPHDj39/vY5MMJ7B8WfpLkijekKnMSlfs2IatQvrv894eJLDs3Z
         9w3W/FObX8wO3fFl2ZDwGFlvuWjwpVEisF3pIcqJcMHLQ2y2qZPzEcSuym7r0sLPpWxO
         1baywUJhdNpd+Gq89Dnn1LxxC1026QFKevc0z4a2uD3oFLTLKni7cvVPY7rHEjy5AAPG
         tQ5Q==
X-Forwarded-Encrypted: i=1; AHgh+RohfZnK7CDt3Zs2sqWiaRuIz1Y3QcA2F2lS0nuam5Q+06NllOZiK55vQU3M1ElLwYK5+wSyLlhdjBr1ZQ==@lists.linux.dev
X-Gm-Message-State: AFuF++mWnsKu2F18AO4WIqnGeVaf6miYLIvF3Ibv+auZaTdL4UUSeL9K
	3qRluv/tAiIEzErk1NEVSxd2wonjRXxMiCX5VG+zpBh/FdGO5FtCkFE8Yal6K3Sdhz9vhnR5qFf
	kbx6ZNLUGBuriwWC9m8kuHgq+pueoCvwi4WS1Rgp1ztuVTqZtQXotQkXfvpJTpYDh
X-Gm-Gg: AR+sD10bg1opf9LBwRQLcg4rTnhVXTz0m5XYKKqs3qLl0reCPg/Iv/CWvf8Xv1EvM36
	9UKzZH9SB0+F6JVAs1lk01buBz1tHqdmy1hJGvTj7LRB+wYjOJi9ZeNS4wFTaxjtUwyyks3Y6Zt
	hfcGh5dm+DQQjLVnOt34a5iH8XoNhC1HQXrCUL//txGkB7zzmW8MqF0QcIWaMLiFWpZTSBKLRqj
	sZ8kjWdtqi59ecJ0O0IM6agv4dHbRDWuVKXr/MkXwmgDxLsuzc9yxJg4FwdgeDiBTv3cslrkUTG
	x1GAeXESOjbQlO4HMQunSxRS3yn9xpMpaouB02sK5cX0rLGpjGoWHnDNQzwPCAlOMSuzqRYAv77
	eFZiobsLgQh4V2q5f6X/JG3/mGujtQj3ja8E=
X-Received: by 2002:a05:690c:e0c1:10b0:81e:a4cf:131b with SMTP id 00721157ae682-849f4a7cc91mr76173137b3.22.1787577403131;
        Mon, 24 Aug 2026 06:16:43 -0700 (PDT)
X-Received: by 2002:a05:690c:e0c1:10b0:81e:a4cf:131b with SMTP id 00721157ae682-849f4a7cc91mr76172227b3.22.1787577402495;
        Mon, 24 Aug 2026 06:16:42 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-84ca5d254adsm33243617b3.16.2026.08.24.06.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:16:41 -0700 (PDT)
Date: Mon, 24 Aug 2026 09:16:34 -0400
From: Brian Masney <bmasney@redhat.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Linus Walleij <linusw@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	David Lechner <david@lechnology.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 29/45] clk: samsung: Make sure clk_init_data is fully
 initialized
Message-ID: <aoxEMm6FGf_onEBf@redhat.com>
References: <cover.1787239813.git.geert+renesas@glider.be>
 <87b3e83137e1a987f3c69d214706e93ef3898cab.1787239813.git.geert+renesas@glider.be>
 <60a8d05a-76fa-43c3-a0f7-fb26a3b659b8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <60a8d05a-76fa-43c3-a0f7-fb26a3b659b8@kernel.org>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AGxi0OHRbvgppxWX-tnRlMZvw2xxwkfgp1G3hP-YkPg_1787577403
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Krzysztof,

On Fri, Aug 21, 2026 at 01:04:01PM +0200, Krzysztof Kozlowski wrote:
> On 21/08/2026 10:53, Geert Uytterhoeven wrote:
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> > 
> > Make sure all members are fully initialized, to avoid such bugs, and to
> > prevent future breakage when converting drivers to a different method
> > for specifying the parents.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Compile-tested only.
> > ---
> >  drivers/clk/samsung/clk-cpu.c | 2 +-
> >  drivers/clk/samsung/clk-pll.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Let me know if I should take it via Samsung SoC clock tree. I assume by
> default this will go directly via clock tree.

Please take it through your Samsung tree to avoid merge conflicts if
there are other changes to these files during this development cycle.

Brian

