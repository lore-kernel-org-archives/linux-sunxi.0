Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55FE23B8
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Sep 2022 17:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2dA7NrdAFVwwxz1Ncs6jZP4zAzFXbxFK4DvpJiCM8ls=; b=AK+lu02rWKtb7+a4fCjFHILAxu
	ihKcWXkdOqYyKNlkIG+nD7Wt0TfMCwtayq+V12LdRyyDx4At/ABH381jN+4haCpc60tB0N3JXQWk0
	Zu7eCsdyiG+gLqQLPkRcL9NkoXHuOyWkTs4Pi95LJtGTGEH/Wtw3Q1Vd8/pjwvTGfPUWsm3jqn7BE
	ebyL/hozG9EqNkbr03k8eOkAyP6lh2oYy9ib1nCoRMw1ZFtYUKvwRjiDeX/Cy9yzntyiSx10KeqWE
	j3lbdElj+6C7TOuT0Yeoi7zHAWkuGuKstSl2ZIPh716tPc3XeN3Kk3vJ7w5w2oQlVCLVxu/Ye98/Z
	7Iue42rg==;
Received: from [2a01:799:961:d200:8cf6:761:40ec:1ff7] (port=58067)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oc8hw-0003WM-8R; Sat, 24 Sep 2022 19:12:52 +0200
Message-ID: <229f1e19-dfe9-eb5b-321a-a2e6549979d1@tronnes.org>
Date: Sat, 24 Sep 2022 19:12:49 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v2 32/33] drm/vc4: vec: Add support for more analog TV
 standards
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
 <20220728-rpi-analog-tv-properties-v2-32-f733a0ed9f90@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-32-f733a0ed9f90@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Den 22.09.2022 16.25, skrev Maxime Ripard:
> From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> 
> Add support for the following composite output modes (all of them are
> somewhat more obscure than the previously defined ones):
> 
> - NTSC_443 - NTSC-style signal with the chroma subcarrier shifted to
>   4.43361875 MHz (the PAL subcarrier frequency). Never used for
>   broadcasting, but sometimes used as a hack to play NTSC content in PAL
>   regions (e.g. on VCRs).
> - PAL_N - PAL with alternative chroma subcarrier frequency,
>   3.58205625 MHz. Used as a broadcast standard in Argentina, Paraguay
>   and Uruguay to fit 576i50 with colour in 6 MHz channel raster.
> - PAL60 - 480i60 signal with PAL-style color at normal European PAL
>   frequency. Another non-standard, non-broadcast mode, used in similar
>   contexts as NTSC_443. Some displays support one but not the other.
> - SECAM - French frequency-modulated analog color standard; also have
>   been broadcast in Eastern Europe and various parts of Africa and Asia.
>   Uses the same 576i50 timings as PAL.
> 
> Also added some comments explaining color subcarrier frequency
> registers.
> 
> Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 

Acked-by: Noralf Trønnes <noralf@tronnes.org>
