Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com [66.111.4.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092161856
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Nov 2022 13:18:08 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.nyi.internal (Postfix) with ESMTP id 28BBB5804AF;
	Fri,  4 Nov 2022 09:18:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 04 Nov 2022 09:18:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1667567887; x=
	1667575087; bh=y4Ya3eCzhqjyISke/moSgSMqf6z0p+qPeXmjWCndzHU=; b=j
	q8NTiN392q0nST1yAbBFObAp1UEDc/ojmFpT0iAPE5z/r4PMGaC4fId3iQeGptm6
	FWLjFpinVP93MH6AtfhuG3R3SoLLFoy7Ke5YHAUs5NRsjZu0uQiMbysmoY1dkwTI
	lTPsfhAswZIEIeb70VN4e87W9T4f8G4VyeMeXaeOv6bmzBQIpPd9z9kbLQfZ92eL
	bHvrTVVTbn+vidqn4F/HCflk5PGgsXO0XEkqcbhSnkYzLL9weGO7sbtL2Qt30r0J
	Z7hcYluTfJwRlSPiZ1Mra5i6LDqTr38lVNjwtzJyTfCYz51+AMQG7mX7Mp5QCgar
	he1KgE1rQuT2sC3gXmQtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567887; x=
	1667575087; bh=y4Ya3eCzhqjyISke/moSgSMqf6z0p+qPeXmjWCndzHU=; b=p
	77m4SJ3Yda84OApgc/2qiMXwwvw1g0Qrf9oHhpsFVO3hYKyr+84+1KOk2sCQa2Jh
	q777cbTvERCsGgx1dba3rYSROY0hi7SxlApSXhYI3lFK9HGEkfPedFNZuyxYrHxw
	1oOHLGEjEAcefv26az2D8veoJZKUNWIZnPj0zGHecB6CKh6L8ZU3hl1WOyOHsoB1
	RhDTJ51i6qk4wJvkuy+rNcYpaZjfZ7lA+PBJsSij1mrE9eMQx2cBkyZGDE034VmJ
	UfFeOdokhtBfnWgXL+VG+yaishbaZs8oKmpAbK35L59OWDQYoc70pZYgkYI2WBDn
	GbEgAFpWL5qEDZZeobzVQ==
X-ME-Sender: <xms:DhFlYzeGeiqR9bOoCawtGPx2fvqaJCWKv1lvmDKGDJJwhvsZslYiHA>
    <xme:DhFlY5Orat-rNn48f6MIerT6X3ATvLmb17SZNibHwEWVukSU3YJA0qavSWEJgr2W9
    V309LuVjzGF5qy61Yg>
X-ME-Received: <xmr:DhFlY8h3dZNXAYOpDp_-_PX1CJUQw0y2uPrK1r0sWS8xrJRtxs89DEXz7iJ8KM2lbCi3e5MfMnVz2zZw9vqLhLs2X05eWiVBRGN8Jw-hOJM20g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
    ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DhFlY08c5XNUM8kRSYOLBaZzFUl_c3em6KJgQIJnfKpnhUR80b3sqg>
    <xmx:DhFlY_vLEwcJUrycobkZDlfoIkTO94PJoxiGtzZtzzZCTOAKJUt_Rw>
    <xmx:DhFlYzH4-wK3VMaKNRdlltwaix0q-zDcttiLlum7H39exSw1t6Y_ug>
    <xmx:DxFlY8PItY0eWiiEGtPH6NToZt07KkDb5jXP8i62sX1CQeT89mKGXQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:18:06 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:26 +0100
Subject: [PATCH v2 09/65] clk: cdce706: Add a determine_rate hook
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-9-f6736dec138e@cerno.tech>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel@ffwll.ch>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Andreas Färber <afaerber@suse.de>,
 Jonathan Hunter <jonathanh@nvidia.com>, Abel Vesa <abelvesa@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Orson Zhai <orsonzhai@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Samuel Holland <samuel@sholland.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sekhar Nori <nsekhar@ti.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 David Airlie <airlied@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Lechner <david@lechnology.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-stm32@st-md-mailman.stormreply.com, alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-mips@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 linux-renesas-soc@vger.kernel.org, linux-actions@lists.infradead.org, linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, patches@opensource.cirrus.com,
 linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=2293; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=RUSlZTA1lXUfioH9cYv2z56GCip4AdcMS3Tt/tJ571A=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAp/jdjHF5kS81ErfGnJ/s7xM08HQ1+oJQneeR1y7+6uY
 sVuuo5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABMpY2BkmFSmsjvlVeVlaZa4NRe/nv
 zyx8zcvL/+lyTP7IvzfvxtWMzI0Dzj1CtrpoUC6teYVa2tEqWbK4x17u/d/tZoddbvpVWbOQA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The cdce706 "clkin" clock implements a mux with a set_parent hook, but
doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidate to
trigger that parent change is a call to clk_set_rate(), with
determine_rate() figuring out which parent is the best suited for a
given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

So, the set_parent hook is effectively unused, possibly because of an
oversight. However, it could also be an explicit decision by the
original author to avoid any reparenting but through an explicit call to
clk_set_parent().

The latter case would be equivalent to setting the flag
CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
to __clk_mux_determine_rate(). Indeed, if no determine_rate
implementation is provided, clk_round_rate() (through
clk_core_round_rate_nolock()) will call itself on the parent if
CLK_SET_RATE_PARENT is set, and will not change the clock rate
otherwise. __clk_mux_determine_rate() has the exact same behavior when
CLK_SET_RATE_NO_REPARENT is set.

And if it was an oversight, then we are at least explicit about our
behavior now and it can be further refined down the line.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-cdce706.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk-cdce706.c b/drivers/clk/clk-cdce706.c
index 1449d0537674..dc046bbf83a1 100644
--- a/drivers/clk/clk-cdce706.c
+++ b/drivers/clk/clk-cdce706.c
@@ -155,6 +155,7 @@ static u8 cdce706_clkin_get_parent(struct clk_hw *hw)
 }
 
 static const struct clk_ops cdce706_clkin_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = cdce706_clkin_set_parent,
 	.get_parent = cdce706_clkin_get_parent,
 };
@@ -471,6 +472,7 @@ static int cdce706_register_clkin(struct cdce706_dev_data *cdce)
 {
 	struct clk_init_data init = {
 		.ops = &cdce706_clkin_ops,
+		.flags = CLK_SET_RATE_NO_REPARENT,
 		.parent_names = cdce->clkin_name,
 		.num_parents = ARRAY_SIZE(cdce->clkin_name),
 	};

-- 
b4 0.11.0-dev-99e3a
