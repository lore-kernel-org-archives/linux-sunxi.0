Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5638717E6
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Sep 2022 15:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gke1xkRA1odUNLi752wozPY1nxpo4Wxt1raghouEVIE=; b=g+UqWr0Hjr75d9JzjXlJ9cNb+q
	CqyP1COZTgtf31kRw/PtV71ZFXx4q4xpkA9XuzvO6vBeR+bqKq0vnO7uxmJoUH+x01kD8ueU+4ivC
	uU3Jz7yZk/F7Q9lL6YXSFpyfpmwXygkLOH3bjOnpO71KuxFmykWyX4Z4qPGaZ+JpGh1HJ0lERgSde
	9ylF2DWGXxyfvJtKlSDR7w9IX0UO06zn/bOg6gONftEhNs1pLsCjHjXd6g/HrT/Z3IG8ZNYfrVChL
	5ljNYNfB6/NFKX+ez+0ZiFKr9gZluEbTFEP1zkjJtI/aIglmCR5ioFbvBfPA556C4H7xo33eC195p
	+pPzb7KQ==;
Received: from [2a01:799:961:d200:8cf6:761:40ec:1ff7] (port=53381)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oc7YV-00026z-1A; Sat, 24 Sep 2022 17:59:03 +0200
Message-ID: <6215f030-32a4-41a0-ec1b-1b06ca4444e1@tronnes.org>
Date: Sat, 24 Sep 2022 17:59:00 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v2 28/33] drm/vc4: vec: Fix definition of PAL-M mode
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Hans de Goede <hdegoede@redhat.com>, nouveau@lists.freedesktop.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, intel-gfx@lists.freedesktop.org,
 Dom Cobley <dom@raspberrypi.com>, linux-sunxi@lists.linux.dev,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 dri-devel@lists.freedesktop.org, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-28-f733a0ed9f90@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-28-f733a0ed9f90@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Den 22.09.2022 16.25, skrev Maxime Ripard:
> From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> 
> PAL-M is a Brazilian analog TV standard that uses a PAL-style chroma
> subcarrier at 3.575611[888111] MHz on top of 525-line (480i60) timings.
> This commit makes the driver actually use the proper VEC preset for this
> mode instead of just changing PAL subcarrier frequency.
> 
> Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 

Acked-by: Noralf Trønnes <noralf@tronnes.org>
