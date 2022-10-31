Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3DF20F2
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 12:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667219139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3lFqSUva8cf7eu6ekgojQtwZeR44+C1N0qDI7SjLRc=;
	b=d6+7AmcZHC8AQLsllLu24pXR2KdHyqwmFqhFNuWpJCilbtCehb8whyTbtxSnuEicQhH4Oi
	NzHR6U8h4WnBKdQdhPoR5N3ckZ6NdDAxrGCYdg/aYE5PHDDKT5Fa863Ke3F/+zk21XBzno
	n1pf5UU4wZYK6SrPKCeCoJphztC5eto=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-Mz4N7HV8O9iOBts7y7agpg-1; Mon, 31 Oct 2022 08:25:28 -0400
X-MC-Unique: Mz4N7HV8O9iOBts7y7agpg-1
Received: by mail-wr1-f71.google.com with SMTP id t12-20020adfa2cc000000b0022adcbb248bso2984594wra.1
        for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 05:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G3lFqSUva8cf7eu6ekgojQtwZeR44+C1N0qDI7SjLRc=;
        b=mc7fYZ1CXEFkAhEYg8ZbKNmcB+neKWAHUppWOmJMR4TN7ZPZF6vyZntPMfHOVRcc9l
         AwdNhfH25RubYtVnQrvhmXOO3cdo8hvSc9x5glbXyZEp+dn07zuIDUQkC3nqhTg9Gybo
         vxtFZQUJ0eO2Y3g30YZ73OiUpwuQheU/nFTCZ+DtyYW52f8YwHywTuFJ0A0O3plvabav
         jxSzSoo3fcTDTIhUHyeeaKlOdftF7AxGE3VJyZMJ441hAtZviPd+frWKP6TISkDLZlc3
         JHa7gupRIY+procUcoqGfJkgsTqPbFhNtI+dMdC+e2YcPkgd/jCg/N2GsUAfQsJztmqJ
         1GoA==
X-Gm-Message-State: ACrzQf3vak2Kmo69VuAaT1jRc+/FgTAlNHNkVTbYwXvi4HdgtokpNYNV
	bfsIUNtm16hSzek6rIByIwjUvT4en00DRXRyXgYSgMxjjZh3Nvb8rI0ktjwlLkhX58IIZkOEl8l
	QVFY++dc/21y1f7O2KlSpMD4=
X-Received: by 2002:a5d:498a:0:b0:236:58ef:6796 with SMTP id r10-20020a5d498a000000b0023658ef6796mr8133535wrq.399.1667219127468;
        Mon, 31 Oct 2022 05:25:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5OaQ4lCdeJx0P85vXeCC9ohI1f8Am/sl3oDUbbTCyW5S09EQhBnmsKMGoGzObNL20EAzLquw==
X-Received: by 2002:a5d:498a:0:b0:236:58ef:6796 with SMTP id r10-20020a5d498a000000b0023658ef6796mr8133518wrq.399.1667219127226;
        Mon, 31 Oct 2022 05:25:27 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m13-20020a05600c3b0d00b003bfaba19a8fsm7382582wms.35.2022.10.31.05.25.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 05:25:26 -0700 (PDT)
Message-ID: <53f341ad-4b72-5546-f752-ca705d62d63c@redhat.com>
Date: Mon, 31 Oct 2022 13:25:25 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 12/21] drm/fb_helper: Rename field fbdev to info in
 struct drm_fb_helper
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
 <20221024111953.24307-13-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-13-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Rename struct drm_fb_helper.fbdev to info. The current name is
> misleading as it overlaps with generic fbdev naming conventions.
> Adapt to the usual naming in fbdev drivers by calling the field
> 'info'. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Agreed. I got confused by this naming in the past.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

