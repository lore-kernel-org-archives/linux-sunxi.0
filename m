Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7317F
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Nov 2022 13:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0oluwF3MFC5G9nU5MZRuvOGbDp+CCD0uCk1Tg0hlT+c=; b=owk2GJZKh5qlQjiCyV5dUWJaVS
	jNRI4egMqrluYANx0YzzXVZkE9xCAd6Q6uvifz4cVTBhQKnnEyqsnDLhK/78ML3lLXZZiJM72thgO
	1FyfO+LqdFy2De2ST59cjpylBugP3vWJdAAgX6u1Ollcr5z+h4FRcVPAKnoFpu//LE7QzlsqtcKww
	As0PZMljtRbk6S+odqMzLbr+M58M7DtrEsA5qiFwcRpD2KNd/VekAQJTFzLapAJQly9FI/oBYmNux
	rcCbqKq+3jHWzZO6dLN4kTdAejBD+PDCDRa/iiW2rmMu6Fv2VbYZp1oKLm+6HOR4nX25xPgwCNsNl
	K1mhnZfQ==;
Received: from [2a01:799:95a:cb00:a93e:4a2b:2c13:303] (port=58078)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1orfQR-0002eF-H2; Sun, 06 Nov 2022 14:10:59 +0100
Message-ID: <0d04cc78-148c-4f72-dcbc-3e2344d4f26a@tronnes.org>
Date: Sun, 6 Nov 2022 14:10:54 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 13/23] drm/modes: Introduce the tv_mode property as a
 command-line option
To: maxime@cerno.tech, Karol Herbst <kherbst@redhat.com>,
 Emma Anholt <emma@anholt.net>, Ben Skeggs <bskeggs@redhat.com>,
 Chen-Yu Tsai <wens@csie.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>
Cc: linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 nouveau@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
References: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
 <20220728-rpi-analog-tv-properties-v6-13-e7792734108f@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v6-13-e7792734108f@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Den 26.10.2022 17.33, skrev maxime@cerno.tech:
> Our new tv mode option allows to specify the TV mode from a property.
> However, it can still be useful, for example to avoid any boot time
> artifact, to set that property directly from the kernel command line.
> 
> Let's add some code to allow it, and some unit tests to exercise that code.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---

I would have just squashed the named mode part of this patch together
with the 2 other named mode patches and keep just the video= option part
here, but up to you:

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
