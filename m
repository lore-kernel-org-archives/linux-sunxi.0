Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12477C
	for <linux-sunxi@lists.linux.dev>; Thu,  8 Sep 2022 11:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KYa/QVI6flq5lHnbp60VYWrYz3i2rBG7tpmdjbr7GZo=; b=GrcJ6yChNMl/rreZ16fGX+KLwn
	GFVb0Zw06qxRhOiTb+mf/0H71iJoRWlPa46/6OVe5vWf2kdgll6709VqoX+K1R8YB7/gyrYPobz3V
	JzCdNscyqgCXvumP4sFMyqb0pZqvlsNP5nYRXe5s14TPZ4tvRtavYU3jbWhEAQ6rYRdYGmQy7oGie
	HExkAsdTKp3hnJM0Ao/DTsVcygRVWsLVuBD9sBT5/Q9ggX6/Rdd8mB9lH7AiB+JgUcU6lgcT+jdiR
	I1SbdI754aUsyUV4yjCBOISLC9wcu4A1N8dVTW+n73EpmvEUNoG/HAwACaFUJgeOIrisfQO3bTsGt
	yh6BCRIw==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=62929)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oWFnx-0005DR-KV; Thu, 08 Sep 2022 13:34:45 +0200
Message-ID: <c6ef022d-1714-b0dd-472c-938614aefc06@tronnes.org>
Date: Thu, 8 Sep 2022 13:34:38 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 32/41] drm/vc4: vec: Convert to the new TV mode
 property
To: Maxime Ripard <maxime@cerno.tech>
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>,
 Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, intel-gfx@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Dom Cobley <dom@raspberrypi.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-32-459522d653a7@cerno.tech>
 <199cf4b3-8ace-e047-3050-b810cf0c6b63@tronnes.org>
 <20220908112312.hlb7mzneuxnethhr@houat>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220908112312.hlb7mzneuxnethhr@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Den 08.09.2022 13.23, skrev Maxime Ripard:
> Hi Noralf,
> 
> On Tue, Aug 30, 2022 at 09:01:08PM +0200, Noralf Trønnes wrote:
>>> +static const struct drm_prop_enum_list tv_mode_names[] = {
>>
>> Maybe call it legacy_tv_mode_enums?
>>
>>>
>>> +	{ VC4_VEC_TV_MODE_NTSC, "NTSC", },
>>>
>>> +	{ VC4_VEC_TV_MODE_NTSC_J, "NTSC-J", },
>>>
>>> +	{ VC4_VEC_TV_MODE_PAL, "PAL", },
>>>
>>> +	{ VC4_VEC_TV_MODE_PAL_M, "PAL-M", },
>>
>> If you use DRM_MODE_TV_MODE_* here you don't need to translate the value
>> using the switch statement in get/set property, you can use the value
>> directly to get/set tv.mode.
> 
> I'm sorry, I'm not quite sure what you mean by that. If we expose the
> DRM_MODE_TV_MODE_* properties there, won't that change the values the
> userspace will need to use to set that property?
> 

You're right ofc, I forgot that the enum values are also UABI.

Noralf.
