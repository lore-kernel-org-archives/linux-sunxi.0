Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F344A1C
	for <linux-sunxi@lists.linux.dev>; Fri, 30 Sep 2022 14:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mNNkRRw0Gbq4V+ztYG6L23EmoagwCkTjNrLNxOdS6h0=; b=pJNR3S8cONTj/8h4P2g2LUDXUa
	P4qz1z/bkXJaUIs7binQsqWk3/AwoR64GRyNbZeAAPKEG3VvG0VqEcUktWPwzbIS2+dyAb3bglkrR
	Gbp26oZwNi/2R9lfWfSlBtmhJWFxmcgI7a8IAf0g/52W794SXMJJL6jGDr825vE7BQXwjQEyRfFWP
	Uy9SFNlE4SEEbsM7JDtb3cgFOqTncjGrvOfEEg27A/Pdv0HXPMkV2SSwbECAhxDsIdVOyX3o9TeE3
	96jn29a4os1mr+hXMBkJegjmqljW/OW889m7G0N9eIO4FA8PmW8PWAHgCqUfr7qmdT5HDwQG4Mp7P
	Q5vpA6jg==;
Received: from [2a01:799:961:d200:c807:6849:43f8:dd23] (port=51305)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oeHIa-0005u3-EX; Fri, 30 Sep 2022 16:47:32 +0200
Message-ID: <7341c6f0-a6ca-25e5-c246-3665da441069@tronnes.org>
Date: Fri, 30 Sep 2022 16:47:24 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v4 03/30] drm/tests: Add Kunit Helpers
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Karol Herbst <kherbst@redhat.com>, Samuel Holland <samuel@sholland.org>,
 Lyude Paul <lyude@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, intel-gfx@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>,
 nouveau@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, Dom Cobley <dom@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
References: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
 <20220728-rpi-analog-tv-properties-v4-3-60d38873f782@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v4-3-60d38873f782@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Den 29.09.2022 18.30, skrev Maxime Ripard:
> As the number of kunit tests in KMS grows further, we start to have
> multiple test suites that, for example, need to register a mock DRM
> driver to interact with the KMS function they are supposed to test.
> 
> Let's add a file meant to provide those kind of helpers to avoid
> duplication.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
