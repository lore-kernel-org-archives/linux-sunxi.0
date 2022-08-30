Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA11C625
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Aug 2022 18:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zbei4Ut8uzhS6GGkmMLBKtyrsxtvuhhXyD9t1OyT8aY=; b=Or1dL8ZCiJbfu4g3b0Tm/Vc5JU
	Cm1ojP5r//wkCsPmbBXi8/vgznhpntVYNXZ+oHZWuMrycECP1X1HJyTz2NiujcEJzHAzNN3alg59c
	et6doSR6Q4Cy+TKAeFfDTvjoB8HDOEK6crZ9Qwy/g02QBUx39nn521SnkFkUihlKTHrMspQvbk4RT
	dQAljMfuXn+UKyoq8nrCHK9Uf3OhrYVV5ntiPGAfvEWMWr2fQQ63zgPi5oAkGLa0D1QFhNcb5EA1Q
	SLQOVvAp6GUsbIaRSd+FM9AzWuUtuAL9Bhm4NRHwTuZu0CjHohxNg6hb3SL/7S0rHY89B52Kmv1Oz
	zjOGlAVw==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=63265)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oT6Kb-00071O-7J; Tue, 30 Aug 2022 20:51:25 +0200
Message-ID: <386c3199-a717-458e-ff59-95caf8bd6b5f@tronnes.org>
Date: Tue, 30 Aug 2022 20:51:21 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 31/41] drm/vc4: vec: Use TV Reset implementation
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>,
 Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 intel-gfx@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Dom Cobley <dom@raspberrypi.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-31-459522d653a7@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-31-459522d653a7@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Den 29.08.2022 15.11, skrev Maxime Ripard:
> The analog TV properties created by the drm_mode_create_tv_properties() are
> 
> not properly initialised at reset. Let's switch our implementation to call
> 
> drm_atomic_helper_connector_tv_reset().
> 
> 
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
