Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7007ED
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Nov 2022 09:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667381968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RgeOXsRJ+XKaYoOYvxoyhBylXQrWD/HUrGfmQUHOZZs=;
	b=GMyX23M7aSNGVk82b+SS7It6CTJk/lQ9QoLZb9G3GYWekXX3VxOsAJVSu7ooUEr4DTltcb
	QBjTHqWzOXxUVb6VYtMzNUbr20bi2FhXiLrJSfo076/gQdN8zQvLvWce+OT0c/d0DcdHaG
	gdlrxhAn/5YwbQH37x36RDrY0Izpm+4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-90-GfrjWkAtPTiDaD7V4r-MEg-1; Wed, 02 Nov 2022 05:39:25 -0400
X-MC-Unique: GfrjWkAtPTiDaD7V4r-MEg-1
Received: by mail-wm1-f71.google.com with SMTP id r187-20020a1c44c4000000b003c41e9ae97dso834504wma.6
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Nov 2022 02:39:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RgeOXsRJ+XKaYoOYvxoyhBylXQrWD/HUrGfmQUHOZZs=;
        b=fLYf8ToI1FNuHuGXqRW2g2O5+58gVRB2o7bsM3sP4r3XHbWl4JCXWrr//EP1d9hS9B
         ShWGYpBQXdsfua1t+ETD4zGhlVaooX782DQxZM6bIPDAhh1466mWksqFaPqO3tJIujtQ
         kdSfTFCwAT4bXjQfeMWKu1GKErymU1CdsoInsIhhQ8pqITujKJxkjZ075Lx3xlIpVVib
         sTbI5WuItBC9/TDodHweftKtfWvxHCh9o9MUKmPBCgQQ4WrJ+Dn21itDJ91Sgx6rnqJY
         P16+ONeo/gv5xOUAJC8h3TYqj8GTSRf0PnUTUwzTogwEsC+f9iIruVEWygZmxtFoXi9q
         4rwQ==
X-Gm-Message-State: ACrzQf2U3sPXDdOmXZaMrbzrsvaBPLnjeJt2j+PQFGZZCmPE5LZHxThh
	9p7FkIu9CUTPxnVLUGJBP+QqaBxVpy5n5JazwY5gbuFE9HlN47h1LXyYqJbVmuMfSzZYPReC/hh
	zQFi40FkKnA+tD727YdUiwW0=
X-Received: by 2002:a5d:40d1:0:b0:236:786d:611e with SMTP id b17-20020a5d40d1000000b00236786d611emr14871564wrq.355.1667381964727;
        Wed, 02 Nov 2022 02:39:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4/k2KHrjikPXyIbTE3cWGjPi0EsRobUeOg55XAJjnO250x+w4Sp4JFFeS1nRK3GUJGY3QPnQ==
X-Received: by 2002:a5d:40d1:0:b0:236:786d:611e with SMTP id b17-20020a5d40d1000000b00236786d611emr14871522wrq.355.1667381964509;
        Wed, 02 Nov 2022 02:39:24 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id dn12-20020a05600c654c00b003cf537ec2efsm1653185wmb.36.2022.11.02.02.39.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 02:39:24 -0700 (PDT)
Message-ID: <23b6c3ca-828a-5376-ae80-0b04202e190b@redhat.com>
Date: Wed, 2 Nov 2022 10:39:22 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 18/21] drm/fb_helper: Minimize damage-helper overhead
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-19-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-19-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Pull the test for fb_dirty into the caller to avoid extra work
> if no callback has been set. In this case no damage handling is
> required and no damage area needs to be computed. Print a warning
> if the damage worker runs without getting an fb_dirty callback.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

But I've a trivial comment below:

>  drivers/gpu/drm/drm_fb_helper.c | 90 ++++++++++++++++++++++-----------
>  1 file changed, 60 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 836523aef6a27..fbc5c5445fdb0 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -449,12 +449,13 @@ static int drm_fb_helper_damage_blit(struct drm_fb_helper *fb_helper,
>  static void drm_fb_helper_damage_work(struct work_struct *work)
>  {
>  	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper, damage_work);
> +	struct drm_device *dev = helper->dev;

You removed this in patch #15, maybe just leaving it in that patch if you
plan to use it again here?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

