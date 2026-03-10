Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19993CE4A6
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Mar 2026 07:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773129383; cv=none; b=gNkbo+GFYHjDILMfEL46uq6oNMVG9AUsaPI50CTqxNDuAmK7VBDJ7Ywk2oVOBbmVbN6K/THz11JgJKWdC23vrQZrvXJMXr51O/Vxes87JWbATgOSnoGdIuTtmZCGK1FLMHYK+4/G1JOKSGKX5Q0hpALvWDUDIAcO1wESPnGzcWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773129383; c=relaxed/simple;
	bh=nQ2aq92nPY2Tq3mrnTTmgvxzkv5QIPMxguxdPCyJHWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=us7tyP31odfoSMoFfzFUJw/rixFPObYBjWd0cwbtrQvNbmV7DX5P0zLfaTa5Iw7lEtdPTcOdB4qh0TuHG55rtUbEvSHEcvajyE5MFajvZ5PTYggiqnXOzrFMRMILXLfS3zsFnUZHC4ZtfVPrAeuZP9pDKYaRaFu+8wf5mLzI65s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1pbl2T2q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RpNcdkGL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1pbl2T2q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RpNcdkGL; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1pbl2T2q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RpNcdkGL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1pbl2T2q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RpNcdkGL"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B5C244D2BB;
	Tue, 10 Mar 2026 07:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773129375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5ETBNAV+ad/4FwFukqRNRhtXvs7BZ43rMufh2WcKYdI=;
	b=1pbl2T2qSPLDOa1uIB1FTBJ7MeaMhLGHdUULnSgmsx1RGfoWCjOx0D3XvZ1ed4J5MZgu0a
	rSL+iYelA/OJG/zBRH10JYSJtZmUugCxY9b9WGy0F9iSPJXeB6SziHKKDLFnQx85pEZGGB
	NqEGO4vQlzYCYUy7y/QrZIatfI0Umq8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773129375;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5ETBNAV+ad/4FwFukqRNRhtXvs7BZ43rMufh2WcKYdI=;
	b=RpNcdkGLAQ1YzhE24KcF/fhsCeeYR3dtmfjSVTD92E52GpzMqzNhBgNwWw0YAvBtA29sqd
	YhzL1/yBMHh/HoDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1pbl2T2q;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=RpNcdkGL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773129375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5ETBNAV+ad/4FwFukqRNRhtXvs7BZ43rMufh2WcKYdI=;
	b=1pbl2T2qSPLDOa1uIB1FTBJ7MeaMhLGHdUULnSgmsx1RGfoWCjOx0D3XvZ1ed4J5MZgu0a
	rSL+iYelA/OJG/zBRH10JYSJtZmUugCxY9b9WGy0F9iSPJXeB6SziHKKDLFnQx85pEZGGB
	NqEGO4vQlzYCYUy7y/QrZIatfI0Umq8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773129375;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5ETBNAV+ad/4FwFukqRNRhtXvs7BZ43rMufh2WcKYdI=;
	b=RpNcdkGLAQ1YzhE24KcF/fhsCeeYR3dtmfjSVTD92E52GpzMqzNhBgNwWw0YAvBtA29sqd
	YhzL1/yBMHh/HoDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 411453F34C;
	Tue, 10 Mar 2026 07:56:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vHpMDp/Or2nAbwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 10 Mar 2026 07:56:15 +0000
Message-ID: <babbee5e-5bd6-4057-8c34-9cff4323e793@suse.de>
Date: Tue, 10 Mar 2026 08:56:14 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 0/4] drm/gem-dma: Support dedicated DMA device for
 allocation
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-sunxi@lists.linux.dev, Paul Kocialkowski <paulk@sys-base.io>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260310032511.2545500-1-wenst@chromium.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20260310032511.2545500-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[chromium.org,gmail.com,collabora.com,kernel.org,pengutronix.de,linux.intel.com,sholland.org,ffwll.ch];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.com:url]
X-Rspamd-Queue-Id: B5C244D2BB
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

Hi

Am 10.03.26 um 04:25 schrieb Chen-Yu Tsai:
> (resent with Samuel's email address fixed)
>
> Hi folks,
>
> This series expands the "dedicated DMA device" support in DRM to the GEM
> DMA helpers, and converts the MediaTek DRM driver to setting the DMA
> device and dropping the custom GEM helpers that implemented this
> function.

I wanted to do this myself at some point. So thanks a lot for picking up 
the task. Happy to see this series.

>
> Various display drivers implement the "dedicated DMA device" support
> with custom GEM helpers. These include Exynos, MediaTek, and Rockchip
> to name a few. Allwinner does something entirely different, calling
> of_dma_configure() on the virtual display device using the OF node of
> the actual DMA device. Recently this causes a warning if IOMMUs are
> involved.
>
> This series intends to allow the core helpers to deal with it, and not
> have every driver implement it in slightly different ways, duplicating
> code.
>
> Patch 1 adds dedicated DMA device support to drm_prime_pages_to_sg().
> I believe this was missing from the original change that added dedicated
> DMA devices for PRIME.

We originally added the dedicated DMA device for supporting PRIME on USB 
graphics adapters, where the DMA buffer has to be allocated wrt to the 
USB controller. We left out anything that wasn't necessary.

>
> Patch 2 adds support for dedicated DMA device to the GEM DMA helpers
> for GEM buffer allocation and mmap.
>
> Patch 3 converts the MediaTek DRM driver to use the dedicated DMA device
> support, and drop all the remaining custom GEM callbacks that deal with
> it.
>
> Patch 4 converts the Allwinner sun4i DRM driver to use the dedicated DMA
> device support, instead of the of_dma_configure() hack it currently has.
>
> The series should be merged through drm-misc-next so that other drivers
> can take advantage of the change.

Yes.

Best regards
Thomas

>
> I also intend to try to convert the Exynos and Rockchip drivers, however
> both also have options to set DMA_ATTR_NO_KERNEL_MAPPING when using
> dma_alloc_attrs() to allocate memory for the buffers. I intend to
> resurrect the DRM_MODE_DUMB_KERNEL_MAP work from Rob Herring [1]
> to handle this. The Rockchip driver also has custom IOMMU attachment
> that I'm still trying to understand.
>
>
> Thanks
> ChenYu
>
>
> Chen-Yu Tsai (4):
>    drm/prime: Limit scatter list size with dedicated DMA device
>    drm/gem-dma: Support dedicated DMA device for allocation and mapping
>    drm/mediatek: Set dedicated DMA device and drop custom GEM callbacks
>    drm/sun4i: Use backend/mixer as dedicated DMA device
>
>   drivers/gpu/drm/drm_gem_dma_helper.c   |  21 ++-
>   drivers/gpu/drm/drm_prime.c            |   2 +-
>   drivers/gpu/drm/mediatek/mtk_crtc.c    |   1 -
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c |  21 +--
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h |   1 -
>   drivers/gpu/drm/mediatek/mtk_gem.c     | 231 -------------------------
>   drivers/gpu/drm/mediatek/mtk_gem.h     |  17 --
>   drivers/gpu/drm/sun4i/sun4i_backend.c  |  27 +--
>   drivers/gpu/drm/sun4i/sun8i_mixer.c    |  27 +--
>   9 files changed, 46 insertions(+), 302 deletions(-)
>   delete mode 100644 drivers/gpu/drm/mediatek/mtk_gem.c
>   delete mode 100644 drivers/gpu/drm/mediatek/mtk_gem.h
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


