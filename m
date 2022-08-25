Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE52B7B
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Aug 2022 12:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xCMa+Y2jIKgZ56OuN/h0oLf2cyBRDehvHfcF2kieVHM=; b=gtp5fNPa37EZTLE4UGvnHplqbA
	vyMYlZGWuG6x/vlNK5aG2I5bnpXR++EbUNXT5tssiuWTzKYGbg/uDWZJyWkScURq7WSC91GXEypRb
	msmYY5Vtm/smg/6qT3kp3/NM+rpKf/Zoo6+pVoVy5NgLXszqvnDIzv7NCZPoHhaw3tEQMyx0T9QWj
	wbSFrbvlHvg0lTIOcpEKPzF60IulT6FyItMHYnBJryjafFhRX/FNOBFHa2MjE0CZe4gxZiQMhS6Vv
	2putyWLiHBGSPlKbLugUZIQCCxB6ySVfyRE0AY7mv9qlkRambhZQ3Bznh1FE0CjI/PFnHyR3kZHCT
	bHMHsv1Q==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=62698)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oRCAx-0005T0-Nh; Thu, 25 Aug 2022 14:41:35 +0200
Message-ID: <3cc08f9d-9f01-b771-c16f-ea95acd7e7cd@tronnes.org>
Date: Thu, 25 Aug 2022 14:41:27 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
 command-line option
To: Maxime Ripard <maxime@cerno.tech>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dom Cobley <dom@raspberrypi.com>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-34-3d53ae722097@cerno.tech>
 <eedb1a86-c1fb-cc76-2a43-4ed349d7d826@tronnes.org>
 <20220824154543.bdtpz2evwzsjrdrz@houat>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220824154543.bdtpz2evwzsjrdrz@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Den 24.08.2022 17.45, skrev Maxime Ripard:
> Hi Noralf,
> 
> On Sat, Aug 20, 2022 at 10:18:47PM +0200, Noralf Trønnes wrote:
>> Den 29.07.2022 18.35, skrev Maxime Ripard:
>>> Our new tv mode option allows to specify the TV mode from a property.
>>> However, it can still be useful, for example to avoid any boot time
>>> artifact, to set that property directly from the kernel command line.
>>>
>>> Let's add some code to allow it, and some unit tests to exercise that code.
>>>
>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>>
>>
>> In the subject it says "tv_mode property", but the property is called
>> "tv norm", so the option should be tv_norm?
> 
> Yeah... I don't know. mode is taken but it's obviously the best name. So
> I went with norm to avoid the (internal) conflict but I left mode for
> the user facing property.
> 
> I'm not sure what's best here, or maybe we can pick another name entirely?
> 

Why not just call it "tv mode" or even better "TV Mode". The state
member can be called tv_mode, but the mode_config member will need a
temporary name until the "mode" property is removed. tv_tv_mode or maybe
connector_tv_mode?

But IMO, if there are no users of this property, adding it should have a
drm maintainers ack.

Noralf.
