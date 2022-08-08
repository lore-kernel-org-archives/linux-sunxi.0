Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDF07C
	for <linux-sunxi@lists.linux.dev>; Mon,  8 Aug 2022 12:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aTFI4YVbXZ6usAs6qmL4aqawvxutNGWZ+bPJxb56Zzs=; b=Zf4scpgkroyhRk+7M353lZ2dAj
	GI38loaZk0z2PjpD8QJloqFrxZSPJOneXn9eX16cNTxVJ5l9a0+J+oFOqYDouS2eRMd3y6ll+d3mB
	rRyYXnvzsxNqH3gcZv0WBmHarSLpw0zJ7Ho0DxrA0YLvB/QxyfzdE9j8dm1aHcccDbYD1vMStJ2EM
	qF5qUJckHqLKEdcElFzosBjdoxzWrTFfDU8OOsFluME14BT6mElYm+e6uTugqAXcjEN34ji8HvUCl
	8xJpumDOA98zo4Huk+fgh/sS8iHQt0PzCxyb4ev0Y822Zktqj2EBWABiwyFM2VRF1vlO/Z12wcnDo
	rm0p7o2w==;
Received: from [2a01:799:961:d200:fd91:af1e:9da7:f964] (port=64170)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oL1u9-0000q8-GR; Mon, 08 Aug 2022 14:30:45 +0200
Message-ID: <6e47ce2d-25c7-7254-703d-2a1d3bb64373@tronnes.org>
Date: Mon, 8 Aug 2022 14:30:42 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 03/35] drm/atomic: Add TV subconnector property to
 get/set_property
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
 <20220728-rpi-analog-tv-properties-v1-3-3d53ae722097@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-3-3d53ae722097@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Den 29.07.2022 18.34, skrev Maxime Ripard:
> The subconnector property was created by drm_mode_create_tv_properties(),
> but wasn't exposed to the userspace through the generic
> atomic_get/set_property implementation, and wasn't stored in any generic
> state structure.
> 
> Let's solve this.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 

I just realised that this and the select_subconnector property isn't
used by any drivers. Do you plan to use them? Maybe they don't need to
be wired up at all.

Anyways, up to you:

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>

> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index c74c78a28171..c06d0639d552 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -688,6 +688,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
>  		return -EINVAL;
>  	} else if (property == config->tv_select_subconnector_property) {
>  		state->tv.select_subconnector = val;
> +	} else if (property == config->tv_subconnector_property) {
> +		state->tv.subconnector = val;
>  	} else if (property == config->tv_left_margin_property) {
>  		state->tv.margins.left = val;
>  	} else if (property == config->tv_right_margin_property) {
> @@ -796,6 +798,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
>  			*val = connector->dpms;
>  	} else if (property == config->tv_select_subconnector_property) {
>  		*val = state->tv.select_subconnector;
> +	} else if (property == config->tv_subconnector_property) {
> +		*val = state->tv.subconnector;
>  	} else if (property == config->tv_left_margin_property) {
>  		*val = state->tv.margins.left;
>  	} else if (property == config->tv_right_margin_property) {
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index f8091edf9a33..1e9996b33cc8 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -672,6 +672,7 @@ struct drm_connector_tv_margins {
>  /**
>   * struct drm_tv_connector_state - TV connector related states
>   * @select_subconnector: selected subconnector
> + * @subconnector: detected subconnector
>   * @margins: TV margins
>   * @mode: TV mode
>   * @brightness: brightness in percent
> @@ -683,6 +684,7 @@ struct drm_connector_tv_margins {
>   */
>  struct drm_tv_connector_state {
>  	enum drm_mode_subconnector select_subconnector;
> +	enum drm_mode_subconnector subconnector;
>  	struct drm_connector_tv_margins margins;
>  	unsigned int mode;
>  	unsigned int brightness;
> 
