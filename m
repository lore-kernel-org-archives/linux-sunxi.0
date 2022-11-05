Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00BC7C
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Nov 2022 14:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SgVbqsGWQMafK0LVDGEHH3CM2p+1II+1VUtKulxdtl8=; b=kyLI/V8qkDoyqrVNJkIykEeCkK
	fdLAAIX8ylRKYcarUzgvVCiI1ngOS2TAc0IJ2W/aX5Xm7EsUinW9TyQq3G9gBM254DQkqWZRYYAab
	f0Ihr62/4R73qcp1Raz0gBy4mdIHQtCQy2Ao5pK8SnWXOd6FUDIn7v/i0Mm9IMifEsEWAEzL+w6N8
	yLmvKTqUMMQB1WW/qEkN0rKkZdiZeyQwPH4xl8eOkCN16yXEF16o5IJ8wF2g21akAwWSIsGyIvgUC
	rIokNcssbf/DIbiUOI7bfYGFO2uX0jB2vX7BFPsp2OrMBU1qJQ3cpNhXGUjW7Lu3LjDDCCTHT142Q
	CTULboqA==;
Received: from [2a01:799:95a:cb00:a93e:4a2b:2c13:303] (port=51870)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1orJoC-00050z-Pq; Sat, 05 Nov 2022 15:06:04 +0100
Message-ID: <7694ab01-b85a-4c2d-ec71-2a5ed9ddddf8@tronnes.org>
Date: Sat, 5 Nov 2022 15:06:01 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v6 09/23] drm/modes: Switch to named mode descriptors
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
 <20220728-rpi-analog-tv-properties-v6-9-e7792734108f@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v6-9-e7792734108f@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Den 26.10.2022 17.33, skrev maxime@cerno.tech:
> The current named mode parsing relies only the mode name, and doesn't allow

only the -> only on the

> to specify any other parameter.
> 
> Let's convert that string list to an array of a custom structure that will
> hold the name and some additional parameters in the future.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
