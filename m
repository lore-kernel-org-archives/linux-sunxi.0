Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C402828EA
	for <linux-sunxi@lists.linux.dev>; Mon,  8 Aug 2022 12:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=v49Gv+vvLdx2K8EmwF94ITIRDlwX8hbS7d3UiPb1pM0=; b=qr4XgPypiXoBj/EGs5WV0wPjUl
	Nm//fZoqFvDP4KJ7stWC6EZH8lS3KZAVLRztAS215esJhmOH71vRxOoKydxK0vubFnolyzYbLf1Kd
	erG+gveaYm54y+J6TWgEx9dUiwtGZy47rZRNgE5nvDfgF9OXZVLRxS6I+NPrV56XUhCl/xyT5JAaU
	uvutKHw7fytMD/AA38WxKcsTuhzuxobpDTVjeAt6G4qtbKcK+XQOW8m1vfy7gMOxaP/mlEt/juiCN
	iMsIr/HTF46es8F2dboXYr/sfQAFhCpLo+tlz1XFxfhK36YLld+PtctnTvDRLgA5MmsoiiMfnMzgy
	Jekey9ZA==;
Received: from [2a01:799:961:d200:fd91:af1e:9da7:f964] (port=64062)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oL1pF-0005Gv-RZ; Mon, 08 Aug 2022 14:25:41 +0200
Message-ID: <633ff81a-8fe1-da85-1235-18d14aebf6b0@tronnes.org>
Date: Mon, 8 Aug 2022 14:25:34 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 01/35] drm/atomic-helper: Rename
 drm_atomic_helper_connector_tv_reset to avoid ambiguity
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Phil Elwell <phil@raspberrypi.com>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dom Cobley <dom@raspberrypi.com>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-1-3d53ae722097@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-1-3d53ae722097@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Den 29.07.2022 18.34, skrev Maxime Ripard:
> We currently have two sets of TV properties.
> 
> The first one is there to deal with analog TV properties, creating
> properties such as the TV mode, subconnectors, saturation, hue and so on.
> It's created by calling the drm_mode_create_tv_properties() function.
> 
> The second one is there to deal with properties that might be useful on a
> TV, creating the overscan margins for example. It's created by calling the
> drm_mode_create_tv_margin_properties().
> 
> However, we also have a drm_atomic_helper_connector_tv_reset() function
> that will reset the TV margin properties to their default values, and thus
> is supposed to be called for the latter set. This creates an ambiguity due
> to the inconsistent naming.
> 
> We can thus rename the drm_atomic_helper_connector_tv_reset() function to
> drm_atomic_helper_connector_tv_margins_reset() to remove that ambiguity
> and hopefully make it more obvious.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
