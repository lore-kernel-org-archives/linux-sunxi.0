Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282BA29AB
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Sep 2022 09:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663925199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lBmBrugF1Uc8odU/lwXKGYWTxCtAMKSLu086DYvJSJ0=;
	b=WjwV9+gTG5/gom4P9/8m+NoYfqjwi6au+Z3NbbS8WYvqKbf7Ne6nCKJ2S6KPxBjX3bG/EW
	/QVN+rXpIVksa+cyQRBQNESkWY+wUEsqq7r07xVmI7ni2H1kZvANdCTj0hkTww4N8uVnkv
	+q8CVgtHh0JulluogLTW6l5TAVXmKsQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-328-MaBjopojNi2_Fz7pdMsmRQ-1; Fri, 23 Sep 2022 05:26:38 -0400
X-MC-Unique: MaBjopojNi2_Fz7pdMsmRQ-1
Received: by mail-wr1-f72.google.com with SMTP id e2-20020adf9bc2000000b0022ae4ea0afcso1628284wrc.8
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Sep 2022 02:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=lBmBrugF1Uc8odU/lwXKGYWTxCtAMKSLu086DYvJSJ0=;
        b=7Xux9RBt+tfqvpAyi1SI7WjCKIGnaTmPh5DISCODVhk9ZnJiQ4+bvSI+L4LCC7yro3
         lPyoGCjPWzLSXcYl6rBEXmQdHxaib/AFiT5uvqarckkOH3b5ap/pmYM+e8mxnfK0PQdy
         Vi0WFksAuOYR7tWxp6dqmWfBvy+EgE2ONNuggL3ndSuOT+szi6HYeVhQhbmdr4ssr1YX
         717eMAVcdx6MqqXi3d9hqYUOMUxniMvlujxNq4Ijj59z5SqA/FHZdqJctkQgndh3dQYX
         jofToI7peIzK9U4l/GPTjZOJTooeCk6FAuZ9rbmdYUFfFC78QkIXIS2E7kQ5J7FTqE0C
         26/w==
X-Gm-Message-State: ACrzQf0bNE5bZ5bEhee/C2w38zIXyMUYMjmZ957YcgtOmOQeQrnuWMNL
	X6M3JIj/AhMVkfahvmfHbM9U/tLWRaoZo1erigg5KF1otvQJGJjDhD8fd3T3arGiMkzGyoLyjWq
	j50Hj7LCPa5MkUIMKwU8fDOM=
X-Received: by 2002:a5d:6485:0:b0:226:ecf9:359c with SMTP id o5-20020a5d6485000000b00226ecf9359cmr4764188wri.17.1663925196557;
        Fri, 23 Sep 2022 02:26:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM61+EyXP0DrQbd5lBD5JiT0UCPQrcmRDCgUpYVonrMG8qw0pJ6zzDkEJadTs5GlFRxQTExixQ==
X-Received: by 2002:a5d:6485:0:b0:226:ecf9:359c with SMTP id o5-20020a5d6485000000b00226ecf9359cmr4764139wri.17.1663925196203;
        Fri, 23 Sep 2022 02:26:36 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id bj1-20020a0560001e0100b0022b0214cfa6sm8514250wrb.45.2022.09.23.02.26.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 02:26:35 -0700 (PDT)
Message-ID: <b3c4ee65-fc56-f54c-3946-b6524fb36f72@redhat.com>
Date: Fri, 23 Sep 2022 11:26:34 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 13/33] drm/client: Add some tests for
 drm_connector_pick_cmdline_mode()
To: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard
 <maxime@cerno.tech>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-13-f733a0ed9f90@cerno.tech>
 <49ea7c7c-7d4c-8348-ea75-e0f376111e4c@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <49ea7c7c-7d4c-8348-ea75-e0f376111e4c@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/23/22 11:15, Thomas Zimmermann wrote:
> Hi
> 
> Am 22.09.22 um 16:25 schrieb Maxime Ripard:
>> drm_connector_pick_cmdline_mode() is in charge of finding a proper
>> drm_display_mode from the definition we got in the video= command line
>> argument.
>>
>> Let's add some unit tests to make sure we're not getting any regressions
>> there.
>>
>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>
>> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
>> index bbc535cc50dd..d553e793e673 100644
>> --- a/drivers/gpu/drm/drm_client_modeset.c
>> +++ b/drivers/gpu/drm/drm_client_modeset.c
>> @@ -1237,3 +1237,7 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode)
>>   	return ret;
>>   }
>>   EXPORT_SYMBOL(drm_client_modeset_dpms);
>> +
>> +#ifdef CONFIG_DRM_KUNIT_TEST
>> +#include "tests/drm_client_modeset_test.c"
>> +#endif
> 
> I strongly dislike this style of including source files in each other. 
> It's a recipe for all kind of build errors. Can you do something else?
>

This seems to be the convention used to test static functions and what's
documented in the Kunit docs: https://kunit.dev/third_party/kernel/docs/tips.html#testing-static-functions

I agree with you that's not ideal but I think that consistency with how
it is done by other subsystems is also important.
 
> As the tested function is an internal interface, maybe export a wrapper 
> if tests are enabled, like this:
> 
> #ifdef CONFIG_DRM_KUNIT_TEST
> struct drm_display_mode *
> drm_connector_pick_cmdline_mode_kunit(drm_conenctor)
> {
>    return drm_connector_pick_cmdline_mode(connector)
> }
> EXPORT_SYMBOL(drm_connector_pick_cmdline_mode_kunit)
> #endif
> 
> The wrapper's declaration can be located in the kunit test file.
> 

But that's also not nice since we are artificially exposing these only
to allow the static functions to be called from unit tests. And would
be a different approach than the one used by all other subsystems...

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

