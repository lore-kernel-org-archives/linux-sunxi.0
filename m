Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8936223B2
	for <linux-sunxi@lists.linux.dev>; Fri, 22 Apr 2022 10:35:45 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id 34867580055;
	Fri, 22 Apr 2022 06:35:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 22 Apr 2022 06:35:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1650623744; x=
	1650630944; bh=sialgZLQyO92Jzz731mhx4P39e8kWtOeqoXhw0cCtXY=; b=W
	xTSy59TGhUVrDTR5ZZ9AihUZQI4ztc0COij2niyKHFseYaXY1k1iijFElgMlbzjj
	IgW79/RwLv6Fp4X6u1RNldYGUTYXAc3mckrXYDpkxLD8Z0+bSam6DaOQn6RH8JJV
	Qurrb/7pXjRhV6hrBlyosxRCFXsVsKBzWSBUFBCKC76wZdJrkGNy/PnPSeGc6ESL
	uS9PQ4Df7oGGULaYujEqbEX0gkpBXi38nCiC253MjtXIcEU+DlXgHhcSk5SLyWR8
	DMCfpqY0+5d3saPZJOXn8wIeAiyRKjBJE3kBwqEP2fTi0gJ5AUl4LXi/x+9R7+KU
	HwyrBchREXwkM8JuhkQ5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1650623744; x=1650630944; bh=sialgZLQyO92J
	zz731mhx4P39e8kWtOeqoXhw0cCtXY=; b=xCGQhbzjwFiulmF6LlwEI2cPB3bBF
	0ZqiYsKEqcIu5ZJxYH0mF7KEYuIof1NLNHoW4TtCBHWDqwK+z2RZi+HgbfH1FOpb
	5nEg/us+9DLek/Br6MvB1IWNoskzsjdYAysFTHU1OckKOZaOQbqHZyDf//HLon6T
	d7mcQhAcY1FFLvkEiygt802ZKh7zDfaBMBxNldjoO4kRqUQb6whLZwd8ZmEBlIhp
	ctpWULiSYUe0CMhkaloAbV6hB/Gu4jw3+6LjXHWnZntyvDNrP/WiB1ZJOf9x6Xwc
	3WHrccx3rtfbAlPOI3TziqtZIPUOpSkUOAhqS5u+rspah0ghgnBo8a+Ew==
X-ME-Sender: <xms:_oRiYlIPkSce9J_iB2dx7YVzLXKxS60W4-Vyw3zmLO4U1aLiaFmmbg>
    <xme:_oRiYhJOFbCsPLyYHVGGL4uD5HM-gey6IrG0BNy0SHfJOB4Q2dzZGy0EfuD4xixYV
    3YhQ9CUuNJWy7-W19Q>
X-ME-Received: <xmr:_oRiYtvBLqnHwVb37WFesVwZ0PMShNb6BvWXvV8Vm7Y4HetLslo-SvwCRTZi3P3Uu5oZYU4g5GlpHVUV0fb323r_rgqp4WPTvpHVZpo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdeggddvkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheekffev
    udefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_oRiYma42u8bFsyuaEoHigJkGAD8rHqS6b6IrkpHQB1N2nS1P6TckQ>
    <xmx:_oRiYsbrF1C3QRv8Y5kK58OXIM5reFvVFe9fVe3wBCRWdmYHf-Yu9g>
    <xmx:_oRiYqDjcSeHlAIkkqXF6PNc-gW-JT9Geogu1FY8mL5VO4njDgDJWQ>
    <xmx:AIViYlRpbFTOma7kkn3FGWD0v6WQLAHvvXHX_xxmOtMZ2RMdHubTSg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Apr 2022 06:35:42 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
	inki.dae@samsung.com
Cc: Maxime Ripard <maxime@cerno.tech>,
	daniel@ffwll.ch,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	linux-arm-kernel@lists.infradead.org,
	alain.volmat@foss.st.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	samuel@sholland.org,
	linux-samsung-soc@vger.kernel.org,
	p.zabel@pengutronix.de,
	airlied@linux.ie,
	kyungmin.park@samsung.com,
	mripard@kernel.org,
	jernej.skrabec@gmail.com,
	jy0922.shim@samsung.com,
	alim.akhtar@samsung.com,
	krzk@kernel.org,
	heiko@sntech.de,
	linux-sunxi@lists.linux.dev,
	hjc@rock-chips.com,
	wens@csie.org,
	dri-devel@lists.freedesktop.org,
	sw0312.kim@samsung.com
Subject: Re: (subset) [PATCH 5/5] drm/sun4i: hdmi: Replace drm_detect_hdmi_monitor() with is_hdmi
Date: Fri, 22 Apr 2022 12:35:38 +0200
Message-Id: <165062373584.1462930.6032469942386231983.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421170725.903361-6-jose.exposito89@gmail.com>
References: <20220421170725.903361-1-jose.exposito89@gmail.com> <20220421170725.903361-6-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 21 Apr 2022 19:07:25 +0200, José Expósito wrote:
> Once EDID is parsed, the monitor HDMI support information is available
> through drm_display_info.is_hdmi.
> 
> This driver calls drm_detect_hdmi_monitor() to receive the same
> information and stores its own cached value, which is less efficient.
> 
> Avoid calling drm_detect_hdmi_monitor() and use drm_display_info.is_hdmi
> instead and also remove sun4i_hdmi.hdmi_monitor as it is no longer
> necessary.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
