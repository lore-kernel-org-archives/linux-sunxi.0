Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FF9471254
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Aug 2026 19:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787253790; cv=none; b=LHzB6KFWrd8gD1SpTw1BCs9j3396LFDWAZPGJ55r8uEAkx/jfW7yiFYSOWWoJ60h0p63YFIOcBYLgPAf+b1edOtdrEZQhK5mCkdNXib+9HSxuG2R3urlJbrnOROJ38giUY6lZFvph4q+EQQrwiWAx4h8XVsp6fUdT1+cQM3KhCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787253790; c=relaxed/simple;
	bh=netGS3826OfdBhOGaochUMtFJf0sQLAIeCCeC64zFy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D0O4P0/PLMj6JCbD5Vz9DI3r1YGUuptcU6tq29SjquC3m7dmjgf6WFBh1sF2KAHF2yCxlN++18OP6EpkVWF6WiSF9Qhtk1qxQyAFvGVotYv42JGLldluyHgSyznjiNp+s44x7WH58YiNCDZDgz7TuvlnptYMJzyc89KirZQpwSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Z/lECfkj; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Z/lECfkj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1787253782;
	bh=netGS3826OfdBhOGaochUMtFJf0sQLAIeCCeC64zFy4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z/lECfkjbFToU3JpZ1gC29GwO0usnrecHWmwGezXDirrKDcXGevoy3GV4i64Ukya9
	 9PG7VNrZ2nJ8EOhReTgMvEoJsc37vG4X2yEsuLdpzmG1YAHchxwGknkCOS3laEnDdH
	 GbT9SV5XwdQVr0KET+ok6bfPZms9H0iBaoA4stHbkawB7yC1XdnseCMHcR4q4nD/3D
	 J0Va1mGs57pnQHVkQgDxvAHlvnfAzZ/ptDfR7Y1jnf7CQpxmIZR1CtICGW2YeeX/xg
	 cNKlUP8bVXa5+k2jL1cI91WoBK4aWmUUcMUv/3ot36ECMMdQS/0ZQfVdpxeAkyQAOP
	 QcMj6NvMpvxzQ==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0371217E0829;
	Thu, 20 Aug 2026 21:23:01 +0200 (CEST)
Message-ID: <c0d50716-e171-4c2a-9a51-2a5c52c093e5@collabora.com>
Date: Thu, 20 Aug 2026 22:23:01 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 45/69] drm/vc4: hdmi: Convert to common HDMI 2.0
 scrambling infrastructure
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Algea Cao <algea.cao@rock-chips.com>, Daniel Stone <daniels@collabora.com>,
 Liu Ying <victor.liu@nxp.com>, Phong LE <ple@baylibre.com>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
 <20260731-dw-hdmi-qp-scramb-v10-45-294364b2cf15@collabora.com>
 <20260820-tan-spoonbill-of-action-82269e@houat>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260820-tan-spoonbill-of-action-82269e@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/20/26 2:24 PM, Maxime Ripard wrote:
> On Fri, Jul 31, 2026 at 07:19:52PM +0300, Cristian Ciocaltea wrote:
>> Replace driver local scrambling logic with the newly introduced common
>> HDMI 2.0 scrambling support:
>>
>> - Advertise source-side scrambling capability by setting supported HDMI
>>   version based on the variant's max_pixel_clock.
>>
>> - Provide minimal .scrambler_{enable,disable} connector callbacks that
>>   only toggle the VC5 HDMI_SCRAMBLER_CTL register, while delegating
>>   sink-side SCDC programming and periodic status monitoring to
>>   drm_connector_hdmi_{enable,disable}_scrambling().
>>
>> - Drop vc4_hdmi_reset_link() and vc4_hdmi_handle_hotplug(), switching
>>   the .detect_ctx() path to drm_atomic_helper_connector_hdmi_hotplug()
>>   which internally calls drm_connector_hdmi_sync_scdc() to trigger a
>>   CRTC reset on reconnection.
>>
>> - Drop the local scrambling_work delayed workqueue and scdc_enabled
>>   flag, now tracked by the common drm_connector_hdmi layer, as well as
>>   the now unused output_{bpc,color_format} driver data members.
>>
>> No functional change intended.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---

[...]

>> +static int vc4_hdmi_scrambler_enable(struct drm_connector *connector)
>>  {
>> -	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
>> -	struct drm_connector *connector = &vc4_hdmi->connector;
>> +	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
>>  	struct drm_device *drm = connector->dev;
>> -	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
>>  	unsigned long flags;
>>  	int idx;
>>  
>> -	lockdep_assert_held(&vc4_hdmi->mutex);
>> -
>> -	if (!vc4_hdmi_supports_scrambling(vc4_hdmi))
>> -		return;
>> -
>> -	if (!drm_hdmi_mode_needs_scrambling(mode,
>> -					    vc4_hdmi->output_bpc,
>> -					    vc4_hdmi->output_format))
>> -		return;
>> -
>>  	if (!drm_dev_enter(drm, &idx))
>> -		return;
>> -
>> -	drm_scdc_set_high_tmds_clock_ratio(connector, true);
>> -	drm_scdc_set_scrambling(connector, true);
>> +		return -ENODEV;
> 
> Not being able to acquire the device isn't an error, it's something we should ignore.

Ack, will return 0 in both cases.

> 
>>  
>>  	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
>>  	HDMI_WRITE(HDMI_SCRAMBLER_CTL, HDMI_READ(HDMI_SCRAMBLER_CTL) |
>> @@ -793,59 +659,27 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
>>  
>>  	drm_dev_exit(idx);
>>  
>> -	vc4_hdmi->scdc_enabled = true;
>> -
>> -	queue_delayed_work(system_percpu_wq, &vc4_hdmi->scrambling_work,
>> -			   msecs_to_jiffies(SCRAMBLING_POLLING_DELAY_MS));
>> +	return 0;
>>  }
>>  
>> -static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
>> +static int vc4_hdmi_scrambler_disable(struct drm_connector *connector)
>>  {
>> -	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
>> -	struct drm_connector *connector = &vc4_hdmi->connector;
>> +	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
>>  	struct drm_device *drm = connector->dev;
>>  	unsigned long flags;
>>  	int idx;
>>  
>> -	lockdep_assert_held(&vc4_hdmi->mutex);
>> -
>> -	if (!vc4_hdmi->scdc_enabled)
>> -		return;
>> -
>> -	vc4_hdmi->scdc_enabled = false;
>> -
>> -	if (delayed_work_pending(&vc4_hdmi->scrambling_work))
>> -		cancel_delayed_work_sync(&vc4_hdmi->scrambling_work);
>> -
>>  	if (!drm_dev_enter(drm, &idx))
>> -		return;
>> +		return -ENODEV;
> 
> Ditto
> 
> Maxime
